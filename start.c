#include "gba.h"
#include "mode4.h"
#include "start.h"
#include "phaseOne.h"

int startPage = 0;

void goToStart() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    startPage = 0;
}

void drawStartScreen() {
    fillScreen4(0);

    if (startPage == 0) {
        drawString4(5, 10, "Walk up and collide with villager", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPage++;
    } else if (startPage == 1) {
        drawString4(5, 10, "You are here to summit mount rainier...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPage++;
    } else if (startPage == 2) {
        drawString4(5, 10, "If you want to give", 1);
        drawString4(5, 20, "survival your best shot...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPage++;
    } else if (startPage == 3) {
        drawString4(5, 10, "My name is Brady,", 1);
        drawString4(5, 20, "I've led tours for 30 years...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPage++;
    } else if (startPage == 4) {
        drawString4(5, 10, "Three sections await with difficulty...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPage++;
    } else if (startPage == 5) {
        drawString4(5, 10, "We begin with the Ascent", 1);
        drawString4(5, 20, "to Camp Muir...", 1);
        if (BUTTON_PRESSED(BUTTON_START)) startPage++;
    } else if (startPage == 6) {
        drawString4(5, 10, "Let's begin. Here are your items.", 1);
        if (BUTTON_PRESSED(BUTTON_START)) {
            goToPhaseOne();
        }
    }

    flipPages();
    waitForVBlank();
}
