#include "gba.h"
#include "game.h"
#include "sound.h"
#include <stdlib.h>

FLOWER flowers[FLOWERCOUNT];
PLAYER player;
BEE bee;
BERRY berry;

int framecount, timestep, slowdown, timeTrack, count;


int beeScore, playerScore, once;

// initalizes the game
void initGame() {
    framecount = 0;
    beeScore = 0;
    playerScore = 0;
    slowdown = 0;
    timeTrack = 0;
    count = 0;
    once = 1;
    initPlayer();
    initBee();
    initFlowers();
    initBerry();
}

// initializes the player/basket
void initPlayer() {
    player.x = 10;
    player.y = 10;
    player.oldx = player.x;
    player.oldy = player.y;
    player.width = 6;
    player.height = 8;
    player.timestep = 2;
    player.powerup = 0;
    player.color = LIGHTBROWN;
    player.originalSpeed = 0;
}

// initializes the bee
void initBee() {
    bee.x = 165;
    bee.y = 150;
    bee.width = 12;
    bee.height = 10;
    bee.left = 1;
    bee.up = 1;
    bee.right = 0;
    bee.down = 0;
    bee.color = PALEYELLOW;
}

// initializes the berry
void initBerry() {
    berry.x = 100;
    berry.y = 80;
    berry.width = 8;
    berry.height = 10;
    berry.active = 0;
}

// initializes the flowers and randomizes the space between them for each round 
void initFlowers() { 
    for (int i = 0; i < FLOWERCOUNT; i++) {
        flowers[i].width = 4;
        flowers[i].height = 9;
        flowers[i].active = 1;
        flowers[i].erased = 0;

        // picks random colors for the flowers
        int colorPicker = (rand() % 5);
        switch (colorPicker) {
            case 0:
                flowers[i].color = PALEYELLOW;
                break;
            case 1:
                flowers[i].color = PALEPURPLE;
                break;
            case 2:
                flowers[i].color = LIGHTPINK;
                break;
            case 3:
                flowers[i].color = LIGHTBLUE;
                break;
            case 4:
                flowers[i].color = WHITE;
                break; 
        }
    } 

    // semi-randomly spaces out the flowers in a grid pattern
    for (int i = 0; i < 5; i++) {
        int spacer = (rand() % (30 - 10 + 1)) + 10;
        int heightSpacer = (rand() % 7);
        flowers[i].x = spacer + i * 45;
        flowers[i].y = heightSpacer + 10;
    }
    for (int i = 5; i < 10; i++) {
        int spacer = (rand() % (30 - 10 + 1)) + 10;
        int heightSpacer = (rand() % 7);
        flowers[i].x = spacer + (i-5) * 45;
        flowers[i].y = heightSpacer + 40;
    }
    for (int i = 10; i < 15; i++) {
        int spacer = (rand() % (30 - 10 + 1)) + 10;
        int heightSpacer = (rand() % 7);
        flowers[i].x = spacer + (i-10) * 45;
        flowers[i].y = heightSpacer + 70;
    }
    for (int i = 15; i < 20; i++) {
        int spacer = (rand() % (30 - 10 + 1)) + 10;
        int heightSpacer = (rand() % 7);
        flowers[i].x = spacer + (i-15) * 45;
        flowers[i].y = heightSpacer + 100;
    }
    for (int i = 20; i < 25; i++) {
        int spacer = (rand() % (30 - 10 + 1)) + 10;
        int heightSpacer = (rand() % 7);
        flowers[i].x = spacer + (i-20) * 45;
        flowers[i].y = heightSpacer + 130;
    }
}

// updates the game
void updateGame() {
    updatePlayer();
    updateBee();
    updateBerry();
    for (int i = 0; i < FLOWERCOUNT; i++) {
        updateFlowers(&flowers[i]);
    }
}

// updates the flowers and plays a sound when the flowers are collected
void updateFlowers(FLOWER* f) {
    if (f->active) {
        if (collision(bee.x-2,bee.y,bee.width,bee.height,f->x,f->y,4,9)) {
            f->active = 0;
            f->erased = 0;
            beeScore++;
            REG_SND2CNT = DMG_ENV_VOL(5) | DMG_STEP_TIME(7);
            REG_SND2FREQ = NOTE_G6 | SND_RESET | DMG_FREQ_TIMED;
            bee.color = f->color;
        }
        if (collision(player.x,player.y-4,player.width,player.height,f->x,f->y,4,9)) {
            f->active = 0;
            f->erased = 0;
            playerScore++;
            REG_SND2CNT = DMG_ENV_VOL(5) | DMG_STEP_TIME(7);
            REG_SND2FREQ = NOTE_E6 | SND_RESET | DMG_FREQ_TIMED;
        }
    }
}

// updates the player's location and checks for collisions with the bee
void updatePlayer() {

    // activates the berry
    if (playerScore == 5) {
        if (once == 1) {
            player.powerup = 1;
            once = 0;
        }
    }

    // controls player movement
    if (framecount % player.timestep == 0) {
        player.oldx = player.x;
        player.oldy = player.y;
        if (BUTTON_HELD(BUTTON_LEFT) && (player.x > 0)) {
            player.x -= 1;
        }
        if (BUTTON_HELD(BUTTON_RIGHT) && (player.x < 232)) {
            player.x += 1;
        }
        if (BUTTON_HELD(BUTTON_UP) && (player.y > 5)) {
            player.y -= 1;
        }
        if (BUTTON_HELD(BUTTON_DOWN) && (player.y < 156)) {
            player.y += 1;
        }
    }
    // checks for a collision with the bee. slows the player down 
    if (collision(player.x,player.y-4,player.width,player.height,bee.x-2,bee.y,bee.width,bee.height)) {
        timeTrack = 0;
        slowdown = 1;
        player.timestep = 3;
        player.color = LIGHTBLUE;
    }

    // slows down the player after it has collided with the bee and plays a sound
    if (slowdown == 1) {
        REG_SND2CNT = DMG_ENV_VOL(5) | DMG_STEP_TIME(7);
        if (count >= 0 && count < 15) {
            REG_SND2FREQ = NOTE_G3 | SND_RESET | DMG_FREQ_TIMED;
            count++;
        } else if (count >= 15 && count < 30) {
            REG_SND2FREQ = NOTE_F3 | SND_RESET | DMG_FREQ_TIMED;
            count++;
        } else if (count >= 30 && count < 45) {
            REG_SND2FREQ = NOTE_E3 | SND_RESET | DMG_FREQ_TIMED;
            count++;
        } else {
            REG_SND2FREQ = NOTE_E3 | SND_RESET | DMG_FREQ_TIMED;
            count = 0;
        }
        timeTrack++;
        if (timeTrack == 300) {
            if (player.originalSpeed == 1) {
                slowdown = 0;
                player.timestep = 1;
                player.color = LIGHTBROWN;
            } else {
                slowdown = 0;
                player.timestep = 2;
                player.color = LIGHTBROWN;
            }
        }
    }
}

// updates the bee 
void updateBee() {
    // checks for collisions with the berry. prevents the bee from drawing over the berry.
    if (berry.active == 1) {
        if ((collision(bee.x-3,bee.y,bee.width+4,bee.height,berry.x-2,berry.y-2,berry.width,berry.height)) && (collision(player.x,player.y-4,player.width,player.height,berry.x,berry.y,berry.width,berry.height))) {
            drawBerryCover(berry.x,berry.y);
            berry.active = 0;
        } else if (collision(bee.x-3,bee.y,bee.width+4,bee.height,berry.x-2,berry.y-2,berry.width,berry.height)) {
            drawBerry(berry.x,berry.y);
        }
    }
    timestep = 1;
    // moves the bee around the screen
    if (framecount % timestep == 0) {
        bee.oldx = bee.x;
        bee.oldy = bee.y;
        if (bee.up == 1) {
            if (bee.y <= 1) {
                bee.up = 0;
                bee.down = 1;
            } else {
                bee.y--;
            }
        }
        if (bee.down == 1) {
            if (bee.y >= 150) {
                bee.up = 1;
                bee.down = 0;
            } else {
                bee.y++;
            }
        }
        if (bee.left == 1) {
            if (bee.x <= 2) {
                bee.left = 0;
                bee.right = 1;
            } else {
                bee.x--;
            }
        }
        if (bee.right == 1) {
            if (bee.x >= 227) {
                bee.left = 1;
                bee.right = 0;
            } else {
                bee.x++;
            }
        }
    }
}

// draws the flowers
void drawFlowers(FLOWER* f) {
    if (f->active) {
        //drawRect(f->oldx, f->oldy, f->width, f->height, BACKGROUND);
        drawFlower(f->x, f->y, f->color);
    } else if (!f->erased) {
        drawRect(f->x, f->y, f->width, f->height, BACKGROUND);
        f->erased = 1;
    }
}

// updates the berry by checking for a collision with the player or bee
void updateBerry() {
    if (berry.active == 1) {
        if (collision(bee.x-2,bee.y,bee.width,bee.height,berry.x-2,berry.y-2,berry.width,berry.height)) {
            drawBerry(berry.x,berry.y);
        }
        // checks for a collision with the player. speeds the player and changes its color
        if (collision(player.x,player.y-4,player.width,player.height,berry.x,berry.y,berry.width,berry.height)) {
            drawBerryCover(berry.x,berry.y);
            berry.active = 0;
            player.timestep = 1;
            player.originalSpeed = 1;
            player.color = RED;
        }
    }
}

// draws the berry
void drawGameBerry() {
    if (player.powerup == 1) {
        drawBerry(berry.x,berry.y);
        berry.active = 1;
    }
    player.powerup = 0;
}

// draws the game
void drawGame() {
    drawPlayer();
    drawGameBee();
    drawGameBerry();
    for (int i = 0; i < FLOWERCOUNT; i++) {
        drawFlowers(&flowers[i]);
    }
}

// draws the player
void drawPlayer() {
    drawBasketCover(player.oldx, player.oldy, BACKGROUND);
    drawBasket(player.x,player.y, player.color);
}

// draws the bee that moves
void drawGameBee() {
    drawBeeCover(bee.oldx,bee.oldy,BACKGROUND);
    drawBee(bee.x,bee.y,bee.color);
}