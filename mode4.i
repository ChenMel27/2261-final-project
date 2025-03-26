# 1 "mode4.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "mode4.c"
# 1 "mode4.h" 1



# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short *videoBuffer;
# 37 "gba.h"
void waitForVBlank();


int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 69 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 103 "gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 5 "mode4.h" 2




void flipPages();
void setPixel4(int x, int y, u8 colorIndex);
void drawRect4(int x, int y, int width, int height, volatile u8 colorIndex);
void fillScreen4(volatile u8 colorIndex);
void drawImage4(int x, int y, int width, int height, const u8 *img, u8 transparentI);
void drawFullscreenImage4(const u16* image);

void drawChar4(int x, int y, char ch, u8 colorIndex);
void drawString4(int x, int y, char* str, u8 colorIndex);
# 2 "mode4.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 3 "mode4.c" 2


void setPixel4(int x, int y, u8 colorIndex) {
    int index = (y * 240 + x) / 2;
    if (x & 1) {
        videoBuffer[index] = (videoBuffer[index] & 0x00FF) | (colorIndex << 8);
    } else {
        videoBuffer[index] = (videoBuffer[index] & 0xFF00) | colorIndex;
    }
}


void drawRect4(int x, int y, int width, int height, volatile u8 colorIndex) {
    unsigned short color = colorIndex | (colorIndex << 8);

    for (int row = 0; row < height; row++) {
        int start = x;
        int end = x + width;

        int firstPixel = start & 1;
        int lastPixel = end & 1;

        volatile unsigned short *rowStart = (volatile unsigned short *)&videoBuffer[((y + row) * (240) + (start)) / 2];



        if (!firstPixel && !lastPixel) {
            DMANow(3, &color, rowStart, (width / 2) | (2 << 23) | (1 << 31));
        }


        else if (firstPixel && lastPixel) {
            setPixel4(start, y + row, colorIndex);
            if (width > 1) {
                DMANow(3, &color, rowStart + 1, (width / 2) | (2 << 23) | (1 << 31));
            }
            setPixel4(end - 1, y + row, colorIndex);
        }


        else if (!firstPixel && lastPixel) {
            DMANow(3, &color, rowStart, (width / 2) | (2 << 23) | (1 << 31));
            setPixel4(end - 1, y + row, colorIndex);
        }


        else {
            setPixel4(start, y + row, colorIndex);
            DMANow(3, &color, rowStart + 1, (width / 2) | (2 << 23) | (1 << 31));
        }
    }
}


void fillScreen4(volatile u8 colorIndex) {

    unsigned short color = colorIndex | (colorIndex << 8);
    DMANow(3, &color, videoBuffer, (240 * 160 / 2) | (1 << 31) | (2 << 23));
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
    DMANow(3, (volatile void*)image, videoBuffer, (240 * 160 / 2) | (1 << 31));
}


void drawChar4(int x, int y, char ch, u8 colorIndex) {
    for (int c = 0; c < 6; c++) {
        for (int r = 0; r < 8; r++) {
            if (fontdata_6x8[(48 * ch + c + 6 * r)]) setPixel4(x + c, y + r, colorIndex);
        }
    }
}


void drawString4(int x, int y, char* str, u8 colorIndex) {
    while (*str) {
        drawChar4(x, y, *str, colorIndex);
        str++;
        x += 6;
    }
}


void flipPages() {
    if ((*(volatile unsigned short *)0x4000000) & (1 << 4)) {
        videoBuffer = ((unsigned short*) 0x0600A000);
    } else {
        videoBuffer = ((unsigned short*) 0x06000000);
    }
    (*(volatile unsigned short *)0x4000000) ^= (1 << 4);
}
