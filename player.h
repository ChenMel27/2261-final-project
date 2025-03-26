#ifndef PLAYER_H
#define PLAYER_H

#include "gba.h"
#include "sprites.h"

#define MAPWIDTH 512
#define MAPHEIGHT 256
#define SCREENWIDTH 240
#define SCREENHEIGHT 160
#define GRAVITY 1
#define TERMINAL_VELOCITY 4


extern SPRITE player;

unsigned char colorAt(int x, int y);
void initPlayer();
void updatePlayer(int* hOff, int* vOff);
void drawPlayer();


#endif