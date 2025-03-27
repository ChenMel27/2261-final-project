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
#include "startPhasePlayer.h"

unsigned short buttons, oldButtons;
GameState state;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        switch(state) {
            case START_PHASE:
            // Beginning phase top-down
                startPhaseState();
                /*
                 * When player collides / meets the guide, then the dialouge
                 * instructions appear.
                 */
                if (checkPlayerGuideCollision()) {
                    // Mode 4 dialogue
                    goToStart();
                    state = DIALOGUE;
                }
                break;
            case DIALOGUE:
                drawDialouge();
                break;
            case PHASEONE:
            // First game phase side-scrolling
                phaseOneState();
                break;
        }

        waitForVBlank();
    }
}

void initialize() {
    mgba_open();
    goToStartPhase();
}
