# 1 "startInstructions.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "startInstructions.c"
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
# 2 "startInstructions.c" 2
# 1 "mode4.h" 1
# 9 "mode4.h"
void flipPages();
void setPixel4(int x, int y, u8 colorIndex);
void drawRect4(int x, int y, int width, int height, volatile u8 colorIndex);
void fillScreen4(volatile u8 colorIndex);
void drawImage4(int x, int y, int width, int height, const u8 *img, u8 transparentI);
void drawFullscreenImage4(const u16* image);

void drawChar4(int x, int y, char ch, u8 colorIndex);
void drawString4(int x, int y, char* str, u8 colorIndex);
# 3 "startInstructions.c" 2
# 1 "startInstructions.h" 1



void goToStartInstructions();
void drawStartInstructionsDialouge();

int startPage;
# 4 "startInstructions.c" 2
# 1 "phaseOne.h" 1
# 10 "phaseOne.h"
void goToPhaseOne();
void phaseOneState();
# 5 "startInstructions.c" 2

int startPage = 0;

void goToStartInstructions() {
    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | (1 << (8 + (2 % 4))) | (1 << 4);
    startPage = 0;
}

void drawStartInstructionsDialouge() {
    waitForVBlank();
    fillScreen4(0);

    if (startPage == 0) {
        drawString4(7, 60, "Hello...", 1);
        if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) startPage++;
    } else if (startPage == 1) {
        drawString4(5, 60, "You are here to summit mount rainier...", 1);
        if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) startPage++;
    } else if (startPage == 2) {
        drawString4(5, 55, "If you want to give", 1);
        drawString4(5, 65, "survival your best shot...", 1);
        if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) startPage++;
    } else if (startPage == 3) {
        drawString4(5, 55, "My name is Brady,", 1);
        drawString4(5, 65, "I've led tours for 30 years...", 1);
        if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) startPage++;
    } else if (startPage == 4) {
        drawString4(5, 60, "Three sections await with difficulty...", 1);
        if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) startPage++;
    } else if (startPage == 5) {
        drawString4(5, 55, "We begin with the Ascent", 1);
        drawString4(5, 65, "to Camp Muir...", 1);
        if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) startPage++;
    } else if (startPage == 6) {
        drawString4(5, 60, "Let's begin.", 1);
        if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {

            goToPhaseOne();
        }
    }
    waitForVBlank();
    flipPages();
}
