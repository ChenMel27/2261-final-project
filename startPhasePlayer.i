# 1 "startPhasePlayer.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "startPhasePlayer.c"
# 1 "startPhasePlayer.h" 1



# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short *videoBuffer;
# 37 "gba.h"
void waitForVBlank();


int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 69 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 103 "gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 5 "startPhasePlayer.h" 2




void initStartPlayer();
void initGuideSprite();
void updateStartPlayer(int* hOff, int* vOff);
void updateGuideSprite();
void drawStartPlayer();
void drawGuideSprite();
int checkPlayerGuideCollision();
# 2 "startPhasePlayer.c" 2

# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 4 "startPhasePlayer.c" 2
# 1 "townCM.h" 1
# 20 "townCM.h"
extern const unsigned short townCMBitmap[32768];
# 5 "startPhasePlayer.c" 2
# 1 "hiker.h" 1
# 21 "hiker.h"
extern const unsigned short hikerTiles[16384];


extern const unsigned short hikerPal[256];
# 6 "startPhasePlayer.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];

struct attr0 {
  u16 regular;
  u16 affine;
  u16 hide;
  u16 double_affine;
  u16 enable_alpha;
  u16 enable_window;
  u16 enable_mosaic;
  u16 fourBpp;
  u16 eightBpp;
  u16 square;
  u16 wide;
  u16 tall;
};

struct attr1 {
  u16 hflip;
  u16 vflip;
  u16 tiny;
  u16 small;
  u16 medium;
  u16 large;
};

struct oam_attrs {
  struct attr0 attr0;
  struct attr1 attr1;
};
# 93 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int worldX, worldY;
    int width;
    int height;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    int active;
    u8 oamIndex;
} SPRITE;
# 7 "startPhasePlayer.c" 2


int startHikerFrameDelay = 4;
int startHikerFrameCounter = 0;
int startHikerFrame = 0;
int startHikerFrames[] = {12, 16, 20};

extern int hOff, vOff;


SPRITE startPlayer;
SPRITE guide;


extern int sbb;


inline unsigned char startColorAt(int x, int y) {
    return ((unsigned char*)townCMBitmap)[((y) * (512 / 2) + (x))];
}

void initStartPlayer() {
    startPlayer.worldX = 0;
    startPlayer.worldY = 42;
    startPlayer.x = 240 / 2 - 8;
    startPlayer.y = 160 / 2 - 8;
    startPlayer.width = 32;
    startPlayer.height = 64;
    startPlayer.oamIndex = 0;
    startPlayer.numFrames = 3;
    startPlayer.currentFrame = 0;
    startPlayer.isAnimating = 1;
    startPlayer.direction = 0;
    startPlayer.yVel = 0;

    DMANow(3, (void*)hikerPal, ((u16 *)0x5000200), 512 / 2);
    DMANow(3, (void*)hikerTiles, &((CB*) 0x6000000)[4], 32768 / 2);
}

void initGuideSprite() {
    guide.worldX = 10;
    guide.worldY = 166;
    guide.width = 30;
    guide.height = 50;

    guide.oamIndex = 1;
    guide.numFrames = 1;
    guide.currentFrame = 0;
    guide.isAnimating = 0;
    guide.direction = 0;
    guide.yVel = 0;
}

void updateStartPlayer(int* hOff, int* vOff) {
    startPlayer.isAnimating = 0;
    int speed = 1;


    int leftX = startPlayer.worldX;
    int rightX = startPlayer.worldX + startPlayer.width - 1;
    int topY = startPlayer.worldY;
    int bottomY = startPlayer.worldY + startPlayer.height - 1;

    if ((~(buttons) & ((1<<5)))) {
        startPlayer.isAnimating = 1;
        int newX = startPlayer.worldX - speed;
        if (newX >= 0 &&
            startColorAt(newX, topY) != 0 &&
            startColorAt(newX, bottomY) != 0) {
            startPlayer.worldX = newX;
        }
    }

    if ((~(buttons) & ((1<<4)))) {
        startPlayer.isAnimating = 1;
        int newX = startPlayer.worldX + speed;
        if (startPlayer.worldX + startPlayer.width < 256 &&
            startColorAt(newX + startPlayer.width - 1, topY) != 0 &&
            startColorAt(newX + startPlayer.width - 1, bottomY) != 0) {
            startPlayer.worldX = newX;
        }
    }

    if ((~(buttons) & ((1<<6)))) {
        startPlayer.isAnimating = 1;
        int newY = startPlayer.worldY - speed;
        if (newY >= 0 &&
            startColorAt(leftX, newY) != 0 &&
            startColorAt(rightX, newY) != 0) {
            startPlayer.worldY = newY;
        }
    }

    if ((~(buttons) & ((1<<7)))) {
        startPlayer.isAnimating = 1;
        int newY = startPlayer.worldY + speed;
        if (startPlayer.worldY < 256 - startPlayer.height &&
            startColorAt(leftX, newY + startPlayer.height - 1) != 0 &&
            startColorAt(rightX, newY + startPlayer.height - 1) != 0) {
            startPlayer.worldY = newY;
        }
    }


    startHikerFrameCounter++;
    if (startPlayer.isAnimating && startHikerFrameCounter > startHikerFrameDelay) {
        startHikerFrame = (startHikerFrame + 1) % startPlayer.numFrames;
        startHikerFrameCounter = 0;
    } else if (!startPlayer.isAnimating) {
        startHikerFrame = 0;
        startHikerFrameCounter = 0;
    }


    *hOff = startPlayer.worldX - (240 / 2 - startPlayer.width / 2);
    *vOff = startPlayer.worldY - (160 / 2 - startPlayer.height / 2);


    if (*hOff < 0) *hOff = 0;
    if (*vOff < 0) *vOff = 0;
    if (*hOff > 256 - 240) *hOff = 256 - 240;
    if (*vOff > 256 - 160) *vOff = 256 - 160;


    sbb = 20 + (*hOff / 256);
}

void updateGuideSprite() {

}

void drawStartPlayer() {
    int screenX = startPlayer.worldX - hOff;
    int screenY = startPlayer.worldY - vOff;
    shadowOAM[startPlayer.oamIndex].attr0 = ((screenY) & 0xFF) | (0<<8) | (0<<13) | (2<<14);
    shadowOAM[startPlayer.oamIndex].attr1 = ((screenX) & 0x1FF) | (3<<14);
    shadowOAM[startPlayer.oamIndex].attr2 = ((((15) * (32) + (startHikerFrames[startHikerFrame]))) & 0x3FF);
}

void drawGuideSprite() {
    int screenX = guide.worldX - hOff;
    int screenY = guide.worldY - vOff;
    shadowOAM[guide.oamIndex].attr0 = ((screenY) & 0xFF) | (0<<8) | (0<<13) | (2<<14);
    shadowOAM[guide.oamIndex].attr1 = ((screenX) & 0x1FF) | (3<<14) | (1<<12);
    shadowOAM[guide.oamIndex].attr2 = ((((14) * (32) + (24))) & 0x3FF);
}


int checkPlayerGuideCollision() {
    return collision(
        startPlayer.worldX, startPlayer.worldY, startPlayer.width, startPlayer.height,
        guide.worldX, guide.worldY, guide.width, guide.height
    );
}
