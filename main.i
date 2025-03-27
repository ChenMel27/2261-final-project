# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "main.c" 2
# 1 "mode4.h" 1
# 9 "mode4.h"
void flipPages();
void setPixel4(int x, int y, u8 colorIndex);
void drawRect4(int x, int y, int width, int height, volatile u8 colorIndex);
void fillScreen4(volatile u8 colorIndex);
void drawImage4(int x, int y, int width, int height, const u8 *img, u8 transparentI);
void drawFullscreenImage4(const u16* image);

void drawChar4(int x, int y, char ch, u8 colorIndex);
void drawString4(int x, int y, char* str, u8 colorIndex);
# 4 "main.c" 2
# 1 "bgOne.h" 1







extern const unsigned short bgOneMap[2048];
# 5 "main.c" 2
# 1 "bgOneCM.h" 1
# 20 "bgOneCM.h"
extern const unsigned short bgOneCMBitmap[65536];
# 6 "main.c" 2
# 1 "tilesetOne.h" 1
# 21 "tilesetOne.h"
extern unsigned char tilesetOneTiles[8192];


extern unsigned char tilesetOnePal[512];
# 7 "main.c" 2
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
# 8 "main.c" 2
# 1 "phaseOne.h" 1
# 10 "phaseOne.h"
void goToPhaseOne();
void phaseOneState();
# 9 "main.c" 2
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
    int active;
    u8 oamIndex;
} SPRITE;
# 6 "player.h" 2
# 15 "player.h"
extern SPRITE player;

unsigned char colorAt(int x, int y);
void initPlayer();
void updatePlayer(int* hOff, int* vOff);
void drawPlayer();
# 10 "main.c" 2
# 1 "startPhase.h" 1



void goToStartPhase();
void drawStart();
# 11 "main.c" 2
# 1 "start.h" 1



void goToStart();
void drawDialouge();

int startPage;
# 12 "main.c" 2
# 1 "startPhasePlayer.h" 1
# 9 "startPhasePlayer.h"
void initStartPlayer();
void initGuideSprite();
void updateStartPlayer(int* hOff, int* vOff);
void drawStartPlayer();
void drawGuideSprite();
int checkPlayerGuideCollision();
# 13 "main.c" 2

unsigned short buttons, oldButtons;
GameState state;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

        switch(state) {
            case START_PHASE:
                startPhaseState();

                if (checkPlayerGuideCollision()) {
                    goToStart();
                    state = DIALOGUE;
                }
                break;
            case DIALOGUE:
                drawDialouge();
                break;
            case PHASEONE:
                phaseOneState();
                break;
        }

        waitForVBlank();
    }
}

void initialize() {
    mgba_open();
    goToStartPhase();
}
