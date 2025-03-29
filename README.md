## Finished
- **Start Phase (Top-down):**  
  A functioning start phase where the player can walk around a town environment and interact with a guide NPC to go the next state.

- **Dialogue System:**  
  A series of Mode 4 dialogue slides of instructions.

- **Phase One (Side-scroll):**  
  A basic side-scrolling phase where the animated player can walk, jump, and duck with animation and collision detection.

- **Game States Implemented:**
  - START_PHASE – top-down town.
  - DIALOGUE – narrative in Mode 4.
  - PHASEONE – side-scrolling.
  - PAUSE – blank.
  - LOSE – blank.

- **Player & Guide Sprites:**
  - Collision with guide triggers dialogue.
  - Player is hidden w collision with gray tile.

## 🔧 What Still Needs to be Added

- **Win Condition:**
- **2 Gameplay Phases:**
- **Pause Menu Improvements:**
- **Lose State Improvements:**
- **Level Design & Obstacles:**
- **Sound Effects and Music**

## 🐞 Known Bugs

- **Flickering Between States:**  
- **Shadow OAM Sometimes Updates Too Late:**  
- **Player Can Clip Tiles Occasionally**  

## Controls:
- ← → Walk
- ↑ Jump (side-scroll) or up (town)
- ↓` Duck (side-scroll)
- START Pause game or continue dialogue

## Navigation Flow:
1. **Start Phase (Top-down town)**  
   Move around the town with arrow keys. Find the guide (NPC) to trigger dialogue.

2. **Dialogue**  
   Press START to continue through dialogue.

3. **Phase One (Side)**  
   Use arrow keys to move Left or Right, jump, and duck. If the player collides with gray tiles, they lose and go to the LOSE pink screen.

4. **Pause**  
   ANYTIME: Press START to pause. Press START to resume.
