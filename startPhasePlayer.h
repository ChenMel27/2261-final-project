#ifndef START_PHASE_PLAYER_H
#define START_PHASE_PLAYER_H

#include "gba.h"

#define MAPWIDTH 256
#define MAPHEIGHT 256

void initStartPlayer();
void initGuideSprite();
void updateStartPlayer(int* hOff, int* vOff);
void drawStartPlayer();
void drawGuideSprite();
int checkPlayerGuideCollision();

#endif // START_PHASE_PLAYER_H
