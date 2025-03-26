#include "gba.h"
#include "mode0.h"
#include "mode4.h"
#include "bgOne.h"
#include "bgOneCM.h"
#include "tilesetOne.h"
#include "gameState.h"
#include "phaseOne.h"
#include "player.h"
#include "startPhase.h"
#include "start.h"  // for dialogue functions

unsigned short buttons, oldButtons;
GameState state; // use our enum type

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        switch(state) {
            case START_PHASE:
                startPhaseState();  // update and draw the start phase screen
                // When the player presses START on the start phase, switch to dialogue.
                if (BUTTON_PRESSED(BUTTON_START)) {
                    goToStart();  // from start.c: sets up dialogue mode (MODE4)
                    state = DIALOGUE;
                }
                break;
            case DIALOGUE:
                drawDialouge();  // from start.c: shows dialogue pages, then eventually calls goToPhaseOne()
                break;
            case PHASEONE:
                phaseOneState();  // from phaseOne.c: update gameplay
                break;
            // Additional cases...
        }

        waitForVBlank();
    }
}

void initialize() {
    mgba_open();
    goToStartPhase();  // sets up the start phase screen using snowtiles and townMap
    initPlayer();
    // Removed the following DMANow calls because they were overwriting your start phase palette/tiles:
    // DMANow(3, tilesetOnePal, BG_PALETTE, tilesetOnePalLen / 2);
    // DMANow(3, tilesetOneTiles, &CHARBLOCK[0], tilesetOneTilesLen);
}
