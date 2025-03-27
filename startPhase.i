# 1 "startPhase.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "startPhase.c"
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
# 2 "startPhase.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "startPhase.c" 2
# 1 "tilesetOne.h" 1
# 21 "tilesetOne.h"
extern unsigned char tilesetOneTiles[8192];


extern unsigned char tilesetOnePal[512];
# 4 "startPhase.c" 2
# 1 "bgOne.h" 1







extern const unsigned short bgOneMap[2048];
# 5 "startPhase.c" 2
# 1 "phaseOne.h" 1
# 10 "phaseOne.h"
void goToPhaseOne();
void phaseOneState();
# 6 "startPhase.c" 2
# 1 "gameState.h" 1



typedef enum {
    START_PHASE,
    DIALOGUE,
    PHASEONE,
    PHASETWO,
    PHASETHREE,
    PAUSE,
    WIN,
    LOSE
} GameState;

extern GameState state;
# 7 "startPhase.c" 2
# 1 "startPhasePlayer.h" 1
# 9 "startPhasePlayer.h"
void initStartPlayer();
void initGuideSprite();
void updateStartPlayer(int* hOff, int* vOff);
void drawStartPlayer();
void drawGuideSprite();
int checkPlayerGuideCollision();
# 8 "startPhase.c" 2
# 1 "town.h" 1







extern const unsigned short townMap[1024];
# 9 "startPhase.c" 2
# 1 "townCM.h" 1
# 20 "townCM.h"
extern const unsigned short townCMBitmap[32768];
# 10 "startPhase.c" 2
# 1 "snowtiles.h" 1
# 21 "snowtiles.h"
extern const unsigned char snowtilesTiles[7680];


extern const unsigned char snowtilesPal[512];
# 11 "startPhase.c" 2
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
    u8 oamIndex;
} SPRITE;
# 12 "startPhase.c" 2

extern GameState state;
extern int hOff, vOff;
extern int sbb;

void goToStartPhase() {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (1 % 4))) | (1 << 12);
    (*(volatile unsigned short*) 0x400000A) = ((1) << 2) | ((23) << 8) | (0 << 14) | (1 << 7);

    DMANow(3, snowtilesPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, snowtilesTiles, &((CB*) 0x6000000)[1], 7680 / 2);
    DMANow(3, townMap, &((SB*) 0x6000000)[23], (2048) / 2);

    initStartPlayer();
    initGuideSprite();

    hOff = 0;
    vOff = (256 - 160);

    state = START_PHASE;
}

void startPhaseState() {
    updateStartPlayer(&hOff, &vOff);
    (*(volatile unsigned short*) 0x04000014) = hOff;
    (*(volatile unsigned short*) 0x04000016) = vOff;

    drawStartPlayer();
    drawGuideSprite();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}
