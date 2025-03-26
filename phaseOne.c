#include "gba.h"
#include "mode0.h"
#include "tilesetOne.h"
#include "bgOne.h"
#include "phaseOne.h"
#include "gameState.h"
#include "player.h"
#include "bgOneCM.h"

extern GameState state;
int hOff, vOff;
extern int sbb;

void goToPhaseOne() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_SIZE_WIDE;

    DMANow(3, tilesetOnePal, BG_PALETTE, tilesetOnePalLen / 2);
    DMANow(3, tilesetOneTiles, &CHARBLOCK[0], tilesetOneTilesLen / 2);
    DMANow(3, bgOneMap, &SCREENBLOCK[20], 2048);

    initPlayer();

    hOff = 0;
    vOff = MAX_VOFF;

    state = PHASEONE;
}

void phaseOneState() {
    updatePlayer(&hOff, &vOff);  // update player position and camera offsets
    REG_BG0HOFF = hOff;          // apply horizontal scrolling
    REG_BG0VOFF = vOff;          // apply vertical scrolling

    drawPlayer();                // update shadowOAM for the player

    DMANow(3, shadowOAM, OAM, 512);  // copy shadowOAM to OAM
}
