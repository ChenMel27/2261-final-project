#include "player.h"
#include "hiker.h"
#include "gba.h"
#include "mode0.h"
#include "bgOneCM.h"  // your collision map

// Animation variables
int hikerFrameDelay = 4;
int hikerFrameCounter = 0;
int hikerFrame = 0;
int hikerFrames[] = {12, 16, 20};  // Replace with your tile IDs for frames
extern int hOff, vOff;
int isDucking = 0;
SPRITE player;

// Background screen block
int sbb = 20;

// Define a horizontal velocity (if not already in your struct)
#define HORIZONTAL_VELOCITY 1

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
    player.active = 1;
    
    // Set horizontal and initial vertical velocities.
    player.xVel = HORIZONTAL_VELOCITY;
    player.yVel = 0;
    
    DMANow(3, (void*) hikerPal, SPRITE_PAL, hikerPalLen / 2);
    DMANow(3, (void*) hikerTiles, &CHARBLOCK[4], hikerTilesLen / 2);
}

void updatePlayer(int* hOff, int* vOff) {
    player.isAnimating = 0;
    
    // Set ducking state based on the DOWN button.
    if (BUTTON_HELD(BUTTON_DOWN)) {
        isDucking = 1;
    } else {
        isDucking = 0;
    }
    
    // Calculate the four corners of the player's hitbox:
    int leftX = player.worldX;
    int rightX = player.worldX + player.width - 1;
    int topY = player.worldY;
    int bottomY = player.worldY + player.height - 1;
    
    // --- Horizontal Movement ---
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
    
    // --- Vertical Movement ---
    if (BUTTON_PRESSED(BUTTON_UP) && player.yVel == 0) {
        player.yVel = -12; // jump velocity
    }
    
    // Apply gravity.
    player.yVel += GRAVITY;
    if (player.yVel > TERMINAL_VELOCITY) {
        player.yVel = TERMINAL_VELOCITY;
    }
    
    // Vertical movement: Move one pixel at a time.
    if (player.yVel < 0) {
        for (int i = 0; i < -player.yVel; i++) {
            topY = player.worldY;
            if (topY - 1 >= 0 &&
                colorAt(leftX, topY - 1) != 0 &&
                colorAt(rightX, topY - 1) != 0) {
                player.worldY--;
            } else {
                player.yVel = 0;  // hit a ceiling tile
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
                player.yVel = 0;  // landed on solid ground
                break;
            }
        }
    }
    
    // --- Animation Handling ---
    hikerFrameCounter++;
    if (player.isAnimating && hikerFrameCounter > hikerFrameDelay) {
        hikerFrame = (hikerFrame + 1) % player.numFrames;
        hikerFrameCounter = 0;
    } else if (!player.isAnimating) {
        hikerFrame = 0;
        hikerFrameCounter = 0;
    }
    
    // --- Camera Centering ---
    *hOff = player.worldX - (SCREENWIDTH / 2 - player.width / 2);
    *vOff = player.worldY - (SCREENHEIGHT / 2 - player.height / 2);
    
    // Clamp camera to map boundaries.
    if (*hOff < 0) *hOff = 0;
    if (*vOff < 0) *vOff = 0;
    if (*hOff > MAPWIDTH - SCREENWIDTH) *hOff = MAPWIDTH - SCREENWIDTH;
    if (*vOff > MAPHEIGHT - SCREENHEIGHT) *vOff = MAPHEIGHT - SCREENHEIGHT;
    
    // Update screen block index.
    sbb = 20 + (*hOff / 256);
}

void drawPlayer() {
    // Compute the four corners of the player's hitbox.
    int leftX   = player.worldX;
    int rightX  = player.worldX + player.width - 1;
    int topY    = player.worldY;
    int bottomY = player.worldY + player.height - 1;
    
    // If any corner is over the "bad" tile (0x02), hide the sprite.
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
        
        // If ducking, use the duck tile (20,24); otherwise, use the regular animated frame.
        if (isDucking) {
            shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(20, 24);
        } else {
            shadowOAM[player.oamIndex].attr2 = ATTR2_TILEID(hikerFrames[hikerFrame], 15);
        }
    } else {
        shadowOAM[player.oamIndex].attr0 = ATTR0_HIDE;
        return;
    }
}


inline unsigned char colorAt(int x, int y) {
    // Look up the color from your collision map.
    return ((unsigned char*) bgOneCMBitmap)[OFFSET(x, y, MAPWIDTH)];
}
