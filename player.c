#include "player.h"
#include "hiker.h"
#include "gba.h"
#include "mode0.h"
#include "bgOneCM.h"  // your collision map (generated like bgOneCMBitmap)

// Animation variables
int hikerFrameDelay = 4;
int hikerFrameCounter = 0;
int hikerFrame = 0;
int hikerFrames[] = {12, 16, 20};  // Replace with actual tile IDs for frames
extern int hOff,vOff;
SPRITE player;

// Background screen block
int sbb = 20;

void initPlayer() {
    player.worldX = 0;
    player.worldY = 101;
    player.x = SCREENWIDTH / 2 - 8;   // Center horizontally (16x32 sprite)
    player.y = SCREENHEIGHT / 2 - 16; // Center vertically
    player.width = 30;
    player.height = 50;
    player.oamIndex = 0;
    player.numFrames = 3;
    player.currentFrame = 0;
    player.isAnimating = 1;
    player.direction = 0;

    DMANow(3, (void*) hikerPal, SPRITE_PAL, hikerPalLen / 2);
    DMANow(3, (void*) hikerTiles, &CHARBLOCK[4], hikerTilesLen / 2);
}

void updatePlayer(int* hOff, int* vOff) {
    player.isAnimating = 0;

    // Movement input + boundary checks
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player.isAnimating = 1;
        if (player.worldX > 0 &&
            colorAt(player.worldX - 1, player.worldY) != 0 &&
            colorAt(player.worldX - 1, player.worldY + player.height - 1) != 0) {
            player.worldX--;
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.isAnimating = 1;
        if (player.worldX < MAPWIDTH - player.width &&
            colorAt(player.worldX + player.width, player.worldY) != 0 &&
            colorAt(player.worldX + player.width, player.worldY + player.height - 1) != 0) {
            player.worldX++;
        }
    }

    if (BUTTON_PRESSED(BUTTON_UP) && player.yVel == 0) {
        player.yVel = -12; // jump velocity
    }    

    // GRAVITY + JUMPING
    player.yVel += GRAVITY;
    if (player.yVel > TERMINAL_VELOCITY) {
        player.yVel = TERMINAL_VELOCITY;
    }

    if (player.yVel > 0) {
        // FALLING
        for (int i = 0; i < player.yVel; i++) {
            int belowLeft = colorAt(player.worldX, player.worldY + player.height + 1);
            int belowRight = colorAt(player.worldX + player.width - 1, player.worldY + player.height + 1);

            if (belowLeft != 0 && belowRight != 0 &&
                player.worldY < MAPHEIGHT - player.height) {
                player.worldY++;
            } else {
                player.yVel = 0;  // landed
                break;
            }
        }
    } else if (player.yVel < 0) {
        // JUMPING UP
        for (int i = 0; i < -player.yVel; i++) {
            int aboveLeft = colorAt(player.worldX, player.worldY - 1);
            int aboveRight = colorAt(player.worldX + player.width - 1, player.worldY - 1);

            if (aboveLeft != 0 && aboveRight != 0 && player.worldY > 0) {
                player.worldY--;
            } else {
                player.yVel = 0;  // hit ceiling
                break;
            }
        }
    }

    // Animation handling
    hikerFrameCounter++;
    if (player.isAnimating && hikerFrameCounter > hikerFrameDelay) {
        hikerFrame = (hikerFrame + 1) % player.numFrames;
        hikerFrameCounter = 0;
    } else if (!player.isAnimating) {
        hikerFrame = 0;
        hikerFrameCounter = 0;
    }

    // Camera centering
    *hOff = player.worldX - (SCREENWIDTH / 2 - player.width / 2);
    *vOff = player.worldY - (SCREENHEIGHT / 2 - player.height / 2);

    // Clamp camera to map boundaries
    if (*hOff < 0) *hOff = 0;
    if (*vOff < 0) *vOff = 0;
    if (*hOff > MAPWIDTH - SCREENWIDTH) *hOff = MAPWIDTH - SCREENWIDTH;
    if (*vOff > MAPHEIGHT - SCREENHEIGHT) *vOff = MAPHEIGHT - SCREENHEIGHT;

    // Update screen block index if using a wide map
    sbb = 20 + (*hOff / 256); // assumes map uses screenblocks 20–23
}

void drawPlayer() {
    int screenX = player.worldX - hOff;
    int screenY = player.worldY - vOff;

    shadowOAM[player.oamIndex].attr0 = ATTR0_Y(screenY) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[player.oamIndex].attr1 = ATTR1_X(screenX) | ATTR1_LARGE;
    shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(hikerFrames[hikerFrame], 15);
}

inline unsigned char colorAt(int x, int y) {
    return ((unsigned char*) bgOneCMBitmap)[OFFSET(x, y, MAPWIDTH)];
}