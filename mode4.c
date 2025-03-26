#include "mode4.h"
#include "font.h"

// Sets a pixel in mode 4
void setPixel4(int x, int y, u8 colorIndex) {
    int index = (y * 240 + x) / 2;
    if (x & 1) {
        videoBuffer[index] = (videoBuffer[index] & 0x00FF) | (colorIndex << 8);
    } else {
        videoBuffer[index] = (videoBuffer[index] & 0xFF00) | colorIndex;
    }
}

// Draws a rectangle in mode 4
void drawRect4(int x, int y, int width, int height, volatile u8 colorIndex) {
    unsigned short color = colorIndex | (colorIndex << 8);
    
    for (int row = 0; row < height; row++) {
        int start = x;
        int end = x + width;

        int firstPixel = start & 1;
        int lastPixel = end & 1;

        volatile unsigned short *rowStart = (volatile unsigned short *)&videoBuffer[OFFSET(start, y + row, SCREENWIDTH) / 2];

        // Even x, Even width
        // For each row, DMA entire row.
        if (!firstPixel && !lastPixel) {
            DMANow(3, &color, rowStart, (width / 2) | DMA_SOURCE_FIXED | DMA_ON);
        }
        // Odd x, Odd width
        // For each row, setPixel4 for the first pixel (x) then DMA the rest of the row
        else if (firstPixel && lastPixel) {
            setPixel4(start, y + row, colorIndex);
            if (width > 1) {
                DMANow(3, &color, rowStart + 1, (width / 2) | DMA_SOURCE_FIXED | DMA_ON);
            }
            setPixel4(end - 1, y + row, colorIndex);
        }
        // Even x, Odd width
        // For each row, DMA until width - 1, then setPixel4 for the last pixel
        else if (!firstPixel && lastPixel) {
            DMANow(3, &color, rowStart, (width / 2) | DMA_SOURCE_FIXED | DMA_ON);
            setPixel4(end - 1, y + row, colorIndex);
        }
        // Odd x, Even width
        // For each row, setPixel4 for the first pixel (x), DMA the middle, then setPixel4 for the last pixel (x + width - 1)
        else {
            setPixel4(start, y + row, colorIndex);
            DMANow(3, &color, rowStart + 1, (width / 2) | DMA_SOURCE_FIXED | DMA_ON);
        }
    }
}

// Fills the screen in mode 4 using specified palette index
void fillScreen4(volatile u8 colorIndex) {
    // TODO Fill this function in from your Lab06
    unsigned short color = colorIndex | (colorIndex << 8);
    DMANow(3, &color, videoBuffer, (SCREENWIDTH * SCREENHEIGHT / 2) | DMA_ON | DMA_SOURCE_FIXED);
}

void drawImage4(int x, int y, int width, int height, const u8 *img, u8 transparentI) {
    for (int row = 0; row < height; row++) {
        for (int col = 0; col < width; col++) {
            u8 pixel = img[row * width + col];

            if (pixel != transparentI) {
                setPixel4(x + col, y + row, pixel);
            }
        }
    }
}


void drawFullscreenImage4(const u16* image) {
    DMANow(3, (volatile void*)image, videoBuffer, (SCREENWIDTH * SCREENHEIGHT / 2) | DMA_ON);
}

// Draws the specified character at the specified location in Mode 4
void drawChar4(int x, int y, char ch, u8 colorIndex) {
    for (int c = 0; c < 6; c++) {
        for (int r = 0; r < 8; r++) {
            if (fontdata_6x8[(48 * ch + c + 6 * r)]) setPixel4(x + c, y + r, colorIndex);
        }
    }
}

// Draws the specified string at the specified location in Mode 3
void drawString4(int x, int y, char* str, u8 colorIndex) {
    while (*str) {
        drawChar4(x, y, *str, colorIndex);
        str++;
        x += 6;
    }
}

// Flips page being displayed and page being drawn to
void flipPages() {
    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}