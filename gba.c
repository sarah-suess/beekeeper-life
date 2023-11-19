#include "gba.h"
#include "font.h"

// Pointer to the start of video memory
volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

// Draws a rectangle using DMA
void drawRect(int x, int y, int width, int height, volatile unsigned short color) {
    // for (int i = 0; i < height; i++) {
    //     for (int j = 0; j < width; j++) {
    //         setPixel(x + j, y + i, color);
    //     }
    // }
    for (int i = 0; i < height; i++) {
        DMANow(3, &color, videoBuffer + OFFSET(x,y+i,240), DMA_SOURCE_FIXED | width | DMA_16);
    }
}

// Fills the screen using DMA
void fillScreen(volatile unsigned short color) {
    DMANow(3, &color, videoBuffer, DMA_SOURCE_FIXED | DMA_DESTINATION_INCREMENT | DMA_16 | (240 * 160));
}

// Checks for collision between two rectangles
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2) {
    return y1 < y2 + height2 && y1 + height1 > y2 && x1 < x2 + width2 && x1 + width1 > x2;
}

// Waits until drawing pixel 0 of line 160
void waitForVBlank() {
    while (REG_VCOUNT >= 160);
    while (REG_VCOUNT < 160);
}

// Draws the specified character at the specified location in Mode 3
void drawChar(int x, int y, char ch, unsigned short color) {
    for (int c = 0; c < 6; c++) {
        for (int r = 0; r < 8; r++) {
            if (fontdata_6x8[(48 * ch + c + 6 * r)]) setPixel(x + c, y + r, color);
        }
    }
}

// Draws the specified string at the specified location in Mode 3
void drawString(int x, int y, char *str, unsigned short color) {
    while (*str) {
        drawChar(x, y, *str, color);
        str++;
        x += 6;
    }
}

// Pointer to the start of DMA registers
DMA *dma = (DMA *)0x40000B0;

// Activity 2.0: Complete this function
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {
    // Remember to write this function to work with any passed in channel (0, 1, 2, 3).
    
    // Clear cnt in the specified DMA channel
    dma[channel].cnt = 0;

    // Set the src of the specified dma channel to the passed in src
    dma[channel].src = src;

    // Set the dst of the specified dma channel to the passed in dst
    dma[channel].dst = dst;

    // Set the cnt of the specified dma channel to the passed in cnt and turn the dma channel on
    dma[channel].cnt = DMA_ON | cnt;
}

// draws a flower
void drawFlower(int x, int y, unsigned short color) {
    drawRect(x+1,y,2,1,color);
    drawRect(x,y+1,4,2,color);
    drawRect(x+1,y+3,2,1,color);
    drawRect(x+1,y+4,2,5,STEM);
}

// draws a Bee
void drawBee(int x, int y, unsigned short color) {
    drawRect(x,y,10,10,BLACK);
    drawRect(x+1,y,1,10,color);
    drawRect(x+3,y,1,10,color);
    drawRect(x+5,y,1,10,color);
    drawRect(x+7,y,1,10,color);
    drawRect(x+9,y,1,10,color);
    drawRect(x+10,y+2,3,4,BLACK);
    setPixel(x+11,y+3,color);
    drawRect(x-3,y+5,3,1,BLACK);
    drawRect(x-2,y+6,2,1,BLACK);
}

// used to cover bee after it moves
void drawBeeCover(int x, int y, unsigned short color) {
    drawRect(x,y,10,10,color);
    drawRect(x+1,y,1,10,color);
    drawRect(x+3,y,1,10,color);
    drawRect(x+5,y,1,10,color);
    drawRect(x+7,y,1,10,color);
    drawRect(x+9,y,1,10,color);
    drawRect(x+10,y+2,3,4,color);
    setPixel(x+11,y+3,color);
    drawRect(x-3,y+5,3,1,color);
    drawRect(x-2,y+6,2,1,color);
}

// draws Basket/Player
void drawBasket(int x, int y, unsigned short color) {
    drawRect(x,y,8,1,color);
    drawRect(x,y+1,8,1,DARKBROWN);
    drawRect(x+1,y+2,6,1,color);
    drawRect(x+2,y+3,4,1,DARKBROWN);
    drawRect(x,y-2,1,2,DARKBROWN);
    drawRect(x+7,y-2,1,2,DARKBROWN);
    drawRect(x+3,y-5,2,1,DARKBROWN);
    setPixel(x+1,y-3,DARKBROWN);
    setPixel(x+6,y-3,DARKBROWN);
    setPixel(x+2,y-4,DARKBROWN);
    setPixel(x+5,y-4,DARKBROWN);
    // color = dark brown for normal
}

// covers the player after it moves
void drawBasketCover(int x, int y, unsigned short color) {
    drawRect(x,y,8,1,color);
    drawRect(x,y+1,8,1,color);
    drawRect(x+1,y+2,6,1,color);
    drawRect(x+2,y+3,4,1,color);
    drawRect(x,y-2,1,2,color);
    drawRect(x+7,y-2,1,2,color);
    drawRect(x+3,y-5,2,1,color);
    setPixel(x+1,y-3,color);
    setPixel(x+6,y-3,color);
    setPixel(x+2,y-4,color);
    setPixel(x+5,y-4,color);
}

//draws a berry
void drawBerry(int x, int y) {
    drawRect(x,y,4,7,RED);
    drawRect(x-1,y+1,1,5,RED);
    drawRect(x-2,y+2,1,3,RED);
    drawRect(x+4,y+1,1,5,RED);
    drawRect(x+5,y+2,1,3,RED);
    drawRect(x+1,y+7,2,1,RED);
    drawRect(x+1,y-1,2,1,GREEN);
    setPixel(x+1,y-2,GREEN);
    setPixel(x+1,y+1,YELLOW);
    setPixel(x-1,y+2,YELLOW);
    setPixel(x+1,y+3,YELLOW);
    setPixel(x+3,y+2,YELLOW);
    setPixel(x,y+5,YELLOW);
    setPixel(x+2,y+5,YELLOW);
    setPixel(x+5,y+3,YELLOW);
}

// covers the berry once it has been collected
void drawBerryCover(int x, int y) {
    drawRect(x,y,4,7,BACKGROUND);
    drawRect(x-1,y+1,1,5,BACKGROUND);
    drawRect(x-2,y+2,1,3,BACKGROUND);
    drawRect(x+4,y+1,1,5,BACKGROUND);
    drawRect(x+5,y+2,1,3,BACKGROUND);
    drawRect(x+1,y+7,2,1,BACKGROUND);
    drawRect(x+1,y-1,2,1,BACKGROUND);
    setPixel(x+1,y-2,BACKGROUND);
}