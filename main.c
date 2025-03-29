#include "gba.h"
#include "mode0.h"
#include "mode4.h"
#include "bgOne.h"
#include "bgOneCM.h"
#include "tilesetOne.h"
#include "gameState.h"
#include "phaseOne.h"
#include "phaseOnePlayer.h"
#include "startPhase.h"
#include "startInstructions.h"
#include "startPhasePlayer.h"
#include "splashScreen.h"

unsigned short buttons, oldButtons;
GameState state;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        switch(state) {
            case SPLASH:
                splashScreen();
                break;
            case START_PHASE:
            // Beginning phase top-down
                startPhaseState();
                /*
                 * When player collides / meets the guide, then the dialouge
                 * instructions appear.
                 */
                if (checkPlayerGuideCollision()) {
                    // Mode 4 dialogue
                    goToStartInstructions();
                    state = DIALOGUE;
                }
                break;
            case DIALOGUE:
                drawStartInstructionsDialouge();
                break;
            case PHASEONE:
            // First game phase side-scrolling
                phaseOneState();
                break;
            case PHASETWO:
            // First game phase side-scrolling
                phaseTwoState();
                break;
            case PHASETHREE:
            // First game phase side-scrolling
                phaseThreeState();
                break;
            case PAUSE:
                pause();
                break;
            case LOSE:
                lose();
                break;
        }

        waitForVBlank();
    }
}

void initialize() {
    mgba_open();
    goToSplashScreen();
}

void goToPause() {
    state = PAUSE;
}

void pause() {
    // Mode 4
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    fillScreen4(0);

    // Resume game on START press
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStartPhase();
        state = START_PHASE;
    }
}

void goToSplashScreen() {
    state = SPLASH;
}

void splashScreen() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    DMANow(3, (volatile void*)splashScreenPal, BG_PALETTE, 256 | DMA_ON);
    drawFullscreenImage4(splashScreenBitmap);

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStartPhase();
        state = START_PHASE;
    }
}

void goToLose() {
    state = LOSE;
}

void lose() {
    // Mode 4
    REG_DISPCTL = MODE(4) | BG_ENABLE(2);
    fillScreen4(0);

    // Restart on START press
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStartPhase(); // Restart the game
        state = START_PHASE;
    }
}

