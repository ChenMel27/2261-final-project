#ifndef GAMESTATE_H
#define GAMESTATE_H

extern unsigned short buttons, oldButtons;
extern int state;

enum {
    START,
    PHASEONE,
    PHASETWO,
    PHASETHREE,
    PAUSE,
    WIN,
    LOSE
};

#endif
