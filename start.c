#include "gba.h"
#include "mode4.h"
#include "start.h"
#include "phaseOne.h"

int startPage = 0;

void goToStart() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    startPage = 0;
}

void drawDialouge() {
    waitForVBlank();
    fillScreen4(0);

    if (startPage == 0) {
        drawString4(7, 60, "Hello...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPage++;
    } else if (startPage == 1) {
        drawString4(5, 60, "You are here to summit mount rainier...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPage++;
    } else if (startPage == 2) {
        drawString4(5, 55, "If you want to give", 1);
        drawString4(5, 65, "survival your best shot...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPage++;
    } else if (startPage == 3) {
        drawString4(5, 55, "My name is Brady,", 1);
        drawString4(5, 65, "I've led tours for 30 years...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPage++;
    } else if (startPage == 4) {
        drawString4(5, 60, "Three sections await with difficulty...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPage++;
    } else if (startPage == 5) {
        drawString4(5, 55, "We begin with the Ascent", 1);
        drawString4(5, 65, "to Camp Muir...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPage++;
    } else if (startPage == 6) {
        drawString4(5, 60, "Let's begin.", 1);
        if (BUTTON_PRESSED(BUTTON_START)) {
            // After the dialogue ends, then go to the first phase of the game
            goToPhaseOne();
        }
    }
    waitForVBlank();
    flipPages();
}
