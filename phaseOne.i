# 1 "phaseOne.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "phaseOne.c"
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
# 2 "phaseOne.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "phaseOne.c" 2
# 1 "tilesetOne.h" 1
# 21 "tilesetOne.h"
extern unsigned char tilesetOneTiles[8192];


extern unsigned char tilesetOnePal[512];
# 4 "phaseOne.c" 2
# 1 "bgOne.h" 1







extern const unsigned short bgOneMap[2048];
# 5 "phaseOne.c" 2
# 1 "phaseOne.h" 1
# 10 "phaseOne.h"
void goToPhaseOne();
void phaseOneState();
# 6 "phaseOne.c" 2
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
# 7 "phaseOne.c" 2
# 1 "player.h" 1




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
# 6 "player.h" 2
# 15 "player.h"
extern SPRITE player;

unsigned char colorAt(int x, int y);
void initPlayer();
void updatePlayer(int* hOff, int* vOff);
void drawPlayer();
# 8 "phaseOne.c" 2
# 1 "bgOneCM.h" 1
# 20 "bgOneCM.h"
extern const unsigned short bgOneCMBitmap[65536];
# 9 "phaseOne.c" 2

extern GameState state;
int hOff, vOff;
extern int sbb;
extern SPRITE guide;

void goToPhaseOne() {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((20) << 8) | (1 << 14);

    DMANow(3, tilesetOnePal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, tilesetOneTiles, &((CB*) 0x6000000)[0], 8192 / 2);
    DMANow(3, bgOneMap, &((SB*) 0x6000000)[20], 2048);

    initPlayer();

    hOff = 0;
    vOff = (256 - 160);

    state = PHASEONE;
}

void phaseOneState() {
    updatePlayer(&hOff, &vOff);
    (*(volatile unsigned short*) 0x04000010) = hOff;
    (*(volatile unsigned short*) 0x04000012) = vOff;

    shadowOAM[guide.oamIndex].attr0 = (2<<8);
    drawPlayer();

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}
