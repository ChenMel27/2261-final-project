#include "gba.h"
#include "mode0.h"
#include "tilesetOne.h"
#include "bgOne.h"
#include "phaseOne.h"
#include "gameState.h"
#include "startPhasePlayer.h"  // Use the start phase–specific player functions
#include "town.h"
#include "townCM.h"
#include "snowtiles.h"
#include "sprites.h"

extern GameState state;
extern int hOff, vOff;
extern int sbb;

void goToStartPhase() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(1) | SPRITE_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(23) | BG_SIZE_SMALL | BG_8BPP;

    DMANow(3, snowtilesPal, BG_PALETTE, snowtilesPalLen / 2);
    DMANow(3, snowtilesTiles, &CHARBLOCK[1], snowtilesTilesLen / 2);
    DMANow(3, townMap, &SCREENBLOCK[23], townLen / 2);

    initStartPlayer();
    initGuideSprite();

    hOff = 0;
    vOff = MAX_VOFF;

    state = START_PHASE;
}

void startPhaseState() {
    updateStartPlayer(&hOff, &vOff);  // update start-phase player position and camera offsets
    REG_BG1HOFF = hOff;               // apply horizontal scrolling
    REG_BG1VOFF = vOff;               // apply vertical scrolling

    drawStartPlayer();                // update shadowOAM for the start-phase player
    drawGuideSprite();
    DMANow(3, shadowOAM, OAM, 512);    // copy shadowOAM to OAM
}

