#include "phaseOnePlayer.h"
#include "hiker.h"
#include "gba.h"
#include "mode0.h"
#include "bgOneCM.h"
#include "gameState.h"
#include "phaseTwo.h"
#include "phaseThree.h"
#include "health.h"

// Animation variables
int hikerFrameDelay = 4;
int hikerFrameCounter = 0;
int hikerFrame = 0;
int hikerFrames[] = {12, 16, 20};
extern int hOff, vOff;
int isDucking = 0;
SPRITE player;
SPRITE health;

// Bg sbb
int sbb = 20;

void initHealth() {
    health.worldX = 0;
    health.worldY = 101;
    health.x = SCREENWIDTH / 2 - 8;
    health.y = SCREENHEIGHT / 2 - 16;
    health.width = 32;
    health.height = 8;
    health.oamIndex = 3;
    health.currentFrame = 0;
    health.active = 1;
    health.xVel = 0;
    health.yVel = 0;

    // Load health sprite palette into palette slot 1 (offset by 16 entries)
    DMANow(3, (void*) healthPal, SPRITE_PAL + 16, healthPalLen / 2);

    // Load health sprite tiles to CHARBLOCK[5] or wherever you're placing them
    DMANow(3, healthTiles, &CHARBLOCK[5], healthTilesLen / 2);  // health -> block 5

}

void initPlayer() {
    player.worldX = 0;
    player.worldY = 101;
    player.x = SCREENWIDTH / 2 - 8;
    player.y = SCREENHEIGHT / 2 - 16;
    player.width = 30;
    player.height = 50;
    player.oamIndex = 0;
    player.numFrames = 3;
    player.currentFrame = 0;
    player.isAnimating = 1;
    player.direction = 0;
    player.active = 1;
    player.xVel = 1;
    player.yVel = 0;
    
    DMANow(3, (void*) hikerPal, SPRITE_PAL, hikerPalLen / 2);
    DMANow(3, hikerTiles, &CHARBLOCK[4], hikerTilesLen / 2);  // player -> block 4
}

void updatePlayer(int* hOff, int* vOff) {
    player.isAnimating = 0;
    
    // Duck if button held down
    if (BUTTON_HELD(BUTTON_DOWN)) {
        isDucking = 1;
    } else {
        isDucking = 0;
    }
    
    // Four corners of the player for collision sprite
    int leftX = player.worldX;
    int rightX = player.worldX + player.width - 1;
    int topY = player.worldY;
    int bottomY = player.worldY + player.height - 1;
    
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player.isAnimating = 1;
        if (player.worldX > 0 &&
            colorAt(leftX - player.xVel, topY) != 0 &&
            colorAt(leftX - player.xVel, bottomY) != 0) {
            player.worldX -= player.xVel;
        }
    }
    
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.isAnimating = 1;
        if (player.worldX < MAPWIDTH - player.width &&
            colorAt(rightX + player.xVel, topY) != 0 &&
            colorAt(rightX + player.xVel, bottomY) != 0) {
            player.worldX += player.xVel;
        }
    }
    
    // Jump if up button pressed
    // Jump if up button pressed
    if (BUTTON_PRESSED(BUTTON_UP) && player.yVel == 0) {
        player.yVel = -12;

        // Apply some horizontal boost when jumping
        if (BUTTON_HELD(BUTTON_RIGHT)) {
            player.worldX += 8; // jump right
        } else if (BUTTON_HELD(BUTTON_LEFT)) {
            player.worldX -= 4; // jump left
        }
    }


    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    
    // Gravity
    player.yVel += GRAVITY;
    if (player.yVel > TERMINAL_VELOCITY) {
        player.yVel = TERMINAL_VELOCITY;
    }
    
    // Vertical movement... move one pixel at a time
    if (player.yVel < 0) {
        for (int i = 0; i < -player.yVel; i++) {
            topY = player.worldY;
            if (topY - 1 >= 0 &&
                colorAt(leftX, topY - 1) != 0 &&
                colorAt(rightX, topY - 1) != 0) {
                player.worldY--;
            } else {
                player.yVel = 0;  // ceiling
                break;
            }
        }
    } else if (player.yVel > 0) {
        for (int i = 0; i < player.yVel; i++) {
            bottomY = player.worldY + player.height - 1;
            if (bottomY + 1 < MAPHEIGHT &&
                colorAt(leftX, bottomY + 1) != 0 &&
                colorAt(rightX, bottomY + 1) != 0) {
                player.worldY++;
            } else {
                player.yVel = 0;  // landed ground
                break;
            }
        }
    }

    // Check if player has reached the end of the map
    if (player.worldX + player.width >= MAPWIDTH - 1) {
        goToPhaseTwo();
    }
    
    // Animation
    hikerFrameCounter++;
    if (player.isAnimating && hikerFrameCounter > hikerFrameDelay) {
        hikerFrame = (hikerFrame + 1) % player.numFrames;
        hikerFrameCounter = 0;
    } else if (!player.isAnimating) {
        hikerFrame = 0;
        hikerFrameCounter = 0;
    }
    
    // Center the cam
    *hOff = player.worldX - (SCREENWIDTH / 2 - player.width / 2);
    *vOff = player.worldY - (SCREENHEIGHT / 2 - player.height / 2);
    
    // Camera clamp on map
    if (*hOff < 0) *hOff = 0;
    if (*vOff < 0) *vOff = 0;
    if (*hOff > MAPWIDTH - SCREENWIDTH) *hOff = MAPWIDTH - SCREENWIDTH;
    if (*vOff > MAPHEIGHT - SCREENHEIGHT) *vOff = MAPHEIGHT - SCREENHEIGHT;
    
    // Screen block index changed
    sbb = 20 + (*hOff / 256);
}

void drawPlayer() {
    // Four corners of the player
    int leftX   = player.worldX;
    int rightX  = player.worldX + player.width - 1;
    int topY    = player.worldY;
    int bottomY = player.worldY + player.height - 1;
    
    // If any corner is over the bad tile (0x02) hide the sprite
    if (colorAt(leftX, topY) == 0x02 ||
        colorAt(rightX, topY) == 0x02 ||
        colorAt(leftX, bottomY) == 0x02 ||
        colorAt(rightX, bottomY) == 0x02) {
        player.active = 0;
    }
    
    int screenX = player.worldX - hOff;
    int screenY = player.worldY - vOff;
    
    if (player.active) {
        shadowOAM[player.oamIndex].attr0 = ATTR0_Y(screenY) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_TALL;
        shadowOAM[player.oamIndex].attr1 = ATTR1_X(screenX) | ATTR1_LARGE;
        
        // If ducking use the duck tile otherwise animate and use the regular animated frame
        if (isDucking) {
            shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(20, 24);
        } else {
            shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(hikerFrames[hikerFrame], 15);
        }
    } else {
        shadowOAM[player.oamIndex].attr0 = ATTR0_HIDE;
        goToLose();
    }
}

void drawHealth() {
    int screenX = health.x;
    int screenY = health.y;

    if (health.active) {
        
        shadowOAM[health.oamIndex].attr0 = ATTR0_Y(screenY) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_WIDE;
        shadowOAM[health.oamIndex].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM;
        shadowOAM[health.oamIndex].attr2 = ATTR2_TILEID(0, 32) | ATTR2_PALROW(1);

    }
}

inline unsigned char colorAt(int x, int y) {
    return ((unsigned char*) bgOneCMBitmap)[OFFSET(x, y, MAPWIDTH)];
}
