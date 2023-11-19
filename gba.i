# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
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
# 36 "gba.h"
void waitForVBlank();


int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 64 "gba.h"
void drawRect(int x, int y, int width, int height, volatile unsigned short color);
void fillScreen(volatile unsigned short color);
void drawChar(int x, int y, char ch, unsigned short color);
void drawString(int x, int y, char *str, unsigned short color);
void drawFlower(int x, int y, unsigned short color);
void drawBerryCover(int x, int y);
void drawBerry(int x, int y);
void drawBasketCover(int x, int y, unsigned short color);
void drawBasket(int x, int y, unsigned short color);
void drawBeeCover(int x, int y, unsigned short color);
void drawBee(int x, int y, unsigned short color);
# 90 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 2 "gba.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 3 "gba.c" 2


volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;


void drawRect(int x, int y, int width, int height, volatile unsigned short color) {





    for (int i = 0; i < height; i++) {
        DMANow(3, &color, videoBuffer + ((y+i) * (240) + (x)), (2 << 23) | width | (0 << 26));
    }
}


void fillScreen(volatile unsigned short color) {
    DMANow(3, &color, videoBuffer, (2 << 23) | (0 << 21) | (0 << 26) | (240 * 160));
}


int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2) {
    return y1 < y2 + height2 && y1 + height1 > y2 && x1 < x2 + width2 && x1 + width1 > x2;
}


void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) >= 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}


void drawChar(int x, int y, char ch, unsigned short color) {
    for (int c = 0; c < 6; c++) {
        for (int r = 0; r < 8; r++) {
            if (fontdata_6x8[(48 * ch + c + 6 * r)]) (videoBuffer[((y + r) * (240) + (x + c))] = color);
        }
    }
}


void drawString(int x, int y, char *str, unsigned short color) {
    while (*str) {
        drawChar(x, y, *str, color);
        str++;
        x += 6;
    }
}


DMA *dma = (DMA *)0x40000B0;


void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt) {



    dma[channel].cnt = 0;


    dma[channel].src = src;


    dma[channel].dst = dst;


    dma[channel].cnt = (1 << 31) | cnt;
}


void drawFlower(int x, int y, unsigned short color) {
    drawRect(x+1,y,2,1,color);
    drawRect(x,y+1,4,2,color);
    drawRect(x+1,y+3,2,1,color);
    drawRect(x+1,y+4,2,5,((5&31) | (8&31) << 5 | (1&31) << 10));
}


void drawBee(int x, int y, unsigned short color) {
    drawRect(x,y,10,10,((0&31) | (0&31) << 5 | (0&31) << 10));
    drawRect(x+1,y,1,10,color);
    drawRect(x+3,y,1,10,color);
    drawRect(x+5,y,1,10,color);
    drawRect(x+7,y,1,10,color);
    drawRect(x+9,y,1,10,color);
    drawRect(x+10,y+2,3,4,((0&31) | (0&31) << 5 | (0&31) << 10));
    (videoBuffer[((y+3) * (240) + (x+11))] = color);
    drawRect(x-3,y+5,3,1,((0&31) | (0&31) << 5 | (0&31) << 10));
    drawRect(x-2,y+6,2,1,((0&31) | (0&31) << 5 | (0&31) << 10));
}


void drawBeeCover(int x, int y, unsigned short color) {
    drawRect(x,y,10,10,color);
    drawRect(x+1,y,1,10,color);
    drawRect(x+3,y,1,10,color);
    drawRect(x+5,y,1,10,color);
    drawRect(x+7,y,1,10,color);
    drawRect(x+9,y,1,10,color);
    drawRect(x+10,y+2,3,4,color);
    (videoBuffer[((y+3) * (240) + (x+11))] = color);
    drawRect(x-3,y+5,3,1,color);
    drawRect(x-2,y+6,2,1,color);
}


void drawBasket(int x, int y, unsigned short color) {
    drawRect(x,y,8,1,color);
    drawRect(x,y+1,8,1,((11&31) | (6&31) << 5 | (4&31) << 10));
    drawRect(x+1,y+2,6,1,color);
    drawRect(x+2,y+3,4,1,((11&31) | (6&31) << 5 | (4&31) << 10));
    drawRect(x,y-2,1,2,((11&31) | (6&31) << 5 | (4&31) << 10));
    drawRect(x+7,y-2,1,2,((11&31) | (6&31) << 5 | (4&31) << 10));
    drawRect(x+3,y-5,2,1,((11&31) | (6&31) << 5 | (4&31) << 10));
    (videoBuffer[((y-3) * (240) + (x+1))] = ((11&31) | (6&31) << 5 | (4&31) << 10));
    (videoBuffer[((y-3) * (240) + (x+6))] = ((11&31) | (6&31) << 5 | (4&31) << 10));
    (videoBuffer[((y-4) * (240) + (x+2))] = ((11&31) | (6&31) << 5 | (4&31) << 10));
    (videoBuffer[((y-4) * (240) + (x+5))] = ((11&31) | (6&31) << 5 | (4&31) << 10));

}


void drawBasketCover(int x, int y, unsigned short color) {
    drawRect(x,y,8,1,color);
    drawRect(x,y+1,8,1,color);
    drawRect(x+1,y+2,6,1,color);
    drawRect(x+2,y+3,4,1,color);
    drawRect(x,y-2,1,2,color);
    drawRect(x+7,y-2,1,2,color);
    drawRect(x+3,y-5,2,1,color);
    (videoBuffer[((y-3) * (240) + (x+1))] = color);
    (videoBuffer[((y-3) * (240) + (x+6))] = color);
    (videoBuffer[((y-4) * (240) + (x+2))] = color);
    (videoBuffer[((y-4) * (240) + (x+5))] = color);
}


void drawBerry(int x, int y) {
    drawRect(x,y,4,7,((31&31) | (0&31) << 5 | (0&31) << 10));
    drawRect(x-1,y+1,1,5,((31&31) | (0&31) << 5 | (0&31) << 10));
    drawRect(x-2,y+2,1,3,((31&31) | (0&31) << 5 | (0&31) << 10));
    drawRect(x+4,y+1,1,5,((31&31) | (0&31) << 5 | (0&31) << 10));
    drawRect(x+5,y+2,1,3,((31&31) | (0&31) << 5 | (0&31) << 10));
    drawRect(x+1,y+7,2,1,((31&31) | (0&31) << 5 | (0&31) << 10));
    drawRect(x+1,y-1,2,1,((0&31) | (31&31) << 5 | (0&31) << 10));
    (videoBuffer[((y-2) * (240) + (x+1))] = ((0&31) | (31&31) << 5 | (0&31) << 10));
    (videoBuffer[((y+1) * (240) + (x+1))] = ((31&31) | (31&31) << 5 | (0&31) << 10));
    (videoBuffer[((y+2) * (240) + (x-1))] = ((31&31) | (31&31) << 5 | (0&31) << 10));
    (videoBuffer[((y+3) * (240) + (x+1))] = ((31&31) | (31&31) << 5 | (0&31) << 10));
    (videoBuffer[((y+2) * (240) + (x+3))] = ((31&31) | (31&31) << 5 | (0&31) << 10));
    (videoBuffer[((y+5) * (240) + (x))] = ((31&31) | (31&31) << 5 | (0&31) << 10));
    (videoBuffer[((y+5) * (240) + (x+2))] = ((31&31) | (31&31) << 5 | (0&31) << 10));
    (videoBuffer[((y+3) * (240) + (x+5))] = ((31&31) | (31&31) << 5 | (0&31) << 10));
}


void drawBerryCover(int x, int y) {
    drawRect(x,y,4,7,((21&31) | (25&31) << 5 | (20&31) << 10));
    drawRect(x-1,y+1,1,5,((21&31) | (25&31) << 5 | (20&31) << 10));
    drawRect(x-2,y+2,1,3,((21&31) | (25&31) << 5 | (20&31) << 10));
    drawRect(x+4,y+1,1,5,((21&31) | (25&31) << 5 | (20&31) << 10));
    drawRect(x+5,y+2,1,3,((21&31) | (25&31) << 5 | (20&31) << 10));
    drawRect(x+1,y+7,2,1,((21&31) | (25&31) << 5 | (20&31) << 10));
    drawRect(x+1,y-1,2,1,((21&31) | (25&31) << 5 | (20&31) << 10));
    (videoBuffer[((y-2) * (240) + (x+1))] = ((21&31) | (25&31) << 5 | (20&31) << 10));
}
