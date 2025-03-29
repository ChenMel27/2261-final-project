#ifndef GAMESTATE_H
#define GAMESTATE_H

typedef enum {
    SPLASH,
    START_PHASE,  // initial start phase screen (town/background with player)
    DIALOGUE,     // dialogue/instruction pages (Mode 4)
    PHASEONE,     // gameplay phase one
    PHASETWO,
    PHASETHREE,
    PAUSE,
    LOSE
} GameState;

void goToPause();
void pause();
void goToLose();
void lose();

extern GameState state;

#endif
