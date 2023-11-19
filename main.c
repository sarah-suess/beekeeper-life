#include "gba.h"
#include "print.h"
#include "sound.h"
#include <stdio.h>

// prototypes
void initialize();

// state prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// random prototype
void srand();

unsigned short oldButtons;
unsigned short buttons;

// State enum
enum STATE {START, PAUSE, GAME, WIN, LOSE} state;

// random seed
int rSeed;

// counts the frames
int framecount;

// tracks the player and bee scores
int beeScore, playerScore;

// keeps the time and sound when the player slows down
int slowdown, timeTrack, count; 

// ensures the powerup only pops up once
int once;

// text buffers
char beeBuffer[41];
char playerBuffer[41];

int main() {
    REG_DISPCTL = MODE(3) | BG_ENABLE(2);
    mgba_open();
	mgba_printf("Debugging Initialized");

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = REG_BUTTONS;

        // State Machine
        switch(state) {
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }        
    }
}

void initialize() {
    
    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_L = DMG_VOL_LEFT(5) |
                   DMG_VOL_RIGHT(5) |
                   DMG_SND1_LEFT |
                   DMG_SND1_RIGHT |
                   DMG_SND2_LEFT |
                   DMG_SND2_RIGHT |
                   DMG_SND3_LEFT |
                   DMG_SND3_RIGHT |
                   DMG_SND4_LEFT |
                   DMG_SND4_RIGHT;
    REG_SOUNDCNT_H = DMG_MASTER_VOL(2);

    buttons = REG_BUTTONS;
    oldButtons = 0;

    goToStart();
}

// uses an array of chars and an array of colors to spell out press start and set up starting screen
void goToStart() {
    fillScreen(WHITE);
    drawBee(30,55,PALEYELLOW);

    char letters[11] = {'P', 'R', 'E', 'S', 'S', ' ', 'S', 'T','A','R','T'};
    unsigned short colors[11] = {PALEPURPLE, LIGHTBLUE, PALEPURPLE, LIGHTBLUE, PALEPURPLE, RED, LIGHTBLUE, PALEPURPLE, LIGHTBLUE, PALEPURPLE, LIGHTBLUE};
    int col = 55;
    int spacing = 12;
    for(int i = 0; i < 11; i++){
         drawChar(col + (i * spacing), 70, letters[i], colors[i]);
    }

    state = START;
    // begin the seed randomization
    rSeed = 0;
}

// runs every frame of the start state
void start() {
    rSeed++;

    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(rSeed);
        
        goToGame();
        initGame();
    }
}

// takes you to game state
void goToGame() {
    fillScreen(BACKGROUND);
    state = GAME;
}

// Runs every frame of the game state
void game() {
    framecount++;
    updateGame();

    // updates the buffer strings with the current scores
    sprintf(beeBuffer,"%d",beeScore);
    sprintf(playerBuffer,"%d",playerScore);

    

    waitForVBlank();
    // erases old scores, draws new scores
    drawString(190,1,"bee: ", BLACK);
    drawString(190,8,"you: ", BLACK);
    drawRect(220,1,12,8,BACKGROUND);
    drawRect(220,8,12,8,BACKGROUND);
    drawString(220,1,beeBuffer,BLACK);
    drawString(220,9,playerBuffer,BLACK);

    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    //win and lose conditions
    if ((beeScore + playerScore) == 25) {
        if (beeScore > playerScore) {
            goToLose();
        } else {
            goToWin();
        }
    }
}

// Sets up the pause state
void goToPause() {
    fillScreen(WHITE);
    drawBee(60,55,YELLOW);
    drawBasket(170, 82, LIGHTBROWN);
    drawBerry(120,90);
    drawString(84, 60, "game paused!", BLACK);
    waitForVBlank();
    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToStart();
}

// Sets up the win state
void goToWin() {
    fillScreen(WHITE);
    drawString(80, 60, "you won!!!", LIGHTPINK);
    drawString(40, 70, "press start to play again", BLACK);
    waitForVBlank();
    state = WIN;
}

// Runs every frame of the win state
void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {
    fillScreen(WHITE);
    drawString(80, 50, "you lost :(", LIGHTBLUE);
    drawString(30, 60, "how did you let a bee beat you??", BLACK);
    waitForVBlank();
    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}