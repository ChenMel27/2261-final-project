#include "gba.h"
#include "mode0.h"
#include "mode4.h"
#include "bgOne.h"
#include "bgOneCM.h"
#include "tilesetOne.h"
#include "gameState.h"
#include "phaseOne.h"
#include "player.h"

unsigned short buttons, oldButtons;
int state;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        switch(state) {
            case START:
                drawStartScreen();
                break;
            case PHASEONE:
                phaseOneState();
                break;
            case PHASETWO:
                updateGame();
                break;
            case PHASETHREE:
                updateGame();
                break;
            case PAUSE:
                drawPauseScreen();
                break;
            case WIN:
                drawWinScreen();
                break;
            case LOSE:
                drawLoseScreen();
                break;
        }

        waitForVBlank();
    }
}

void initialize() {
    mgba_open();
    goToStart();
    initPlayer();
    DMANow(3, tilesetOnePal, BG_PALETTE, tilesetOnePalLen / 2);
    DMANow(3, tilesetOneTiles, &CHARBLOCK[0], tilesetOneTilesLen); 
}

// --- GAME STATES ---
void updateGame() {
    // Update player logic, camera, collisions, etc.
}

void goToPhaseTwo() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1);
    state = PHASETWO;
}

void goToPhaseThree() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1);
    state = PHASETHREE;
}

void drawPauseScreen() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    fillScreen4(0);
}

void goToPause() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1);
    state = PAUSE;
}

void drawLoseScreen() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    fillScreen4(GREEN);
}

void goToLose() {
    drawLoseScreen();
    state = LOSE;
}

void drawWinScreen() {
    // Draw win screen and celebration
}

void goToWin() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1);
    state = WIN;
}