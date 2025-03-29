#include "gba.h"
#include "mode4.h"
#include "instructions.h"
#include "phaseOne.h"

int startPhaseInstructions = 0;

void goToStartPhaseInstructions() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    startPhaseInstructions = 0;
}

void drawDialouge() {
    waitForVBlank();
    fillScreen4(0);

    if (startPhaseInstructions == 0) {
        drawString4(7, 60, "Hello...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPhaseInstructions++;
    } else if (startPhaseInstructions == 1) {
        drawString4(5, 60, "You are here to summit mount rainier...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPhaseInstructions++;
    } else if (startPhaseInstructions == 2) {
        drawString4(5, 55, "If you want to give", 1);
        drawString4(5, 65, "survival your best shot...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPhaseInstructions++;
    } else if (startPhaseInstructions == 3) {
        drawString4(5, 55, "My name is Brady,", 1);
        drawString4(5, 65, "I've led tours for 30 years...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPhaseInstructions++;
    } else if (startPhaseInstructions == 4) {
        drawString4(5, 60, "Three sections await with difficulty...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPhaseInstructions++;
    } else if (startPhaseInstructions == 5) {
        drawString4(5, 55, "We begin with the Ascent", 1);
        drawString4(5, 65, "to Camp Muir...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPhaseInstructions++;
    } else if (startPhaseInstructions == 6) {
        drawString4(5, 60, "Let's begin.", 1);
        if (BUTTON_PRESSED(BUTTON_START)) {
            // After the dialogue ends, then go to the first phase of the game
            goToPhaseOne();
        }
    }
    waitForVBlank();
    flipPages();
}
