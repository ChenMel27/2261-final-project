#ifndef GAMESTATE_H
#define GAMESTATE_H

typedef enum {
    START_PHASE,  // initial start phase screen (town/background with player)
    DIALOGUE,     // dialogue/instruction pages (Mode 4)
    PHASEONE,     // gameplay phase one
    PHASETWO,
    PHASETHREE,
    PAUSE,
    WIN,
    LOSE
} GameState;

extern GameState state;

#endif
