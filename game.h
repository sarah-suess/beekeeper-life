// player, bee, berry, and flower structs

typedef struct {
    int x;
    int y;
    int oldx;
    int oldy;
    int width;
    int height;
    int timestep;
    int powerup;
    unsigned short color;
    int originalSpeed;
} PLAYER;

typedef struct {
    int x;
    int y;
    int oldx;
    int oldy;
    int width;
    int height;
    int up;
    int down;
    int left;
    int right;
    unsigned short color;
} BEE;

typedef struct {
    int x;
    int y;
    int oldx;
    int oldy;
    int width;
    int height;
    unsigned short color;
    int active;
    int erased;
} FLOWER;

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int active;
} BERRY;

// constants
#define FLOWERCOUNT 25

// variables
extern PLAYER player;
extern BEE bee;
extern BERRY berry;
extern FLOWER flowers[FLOWERCOUNT];

// function prototypes
void initGame();
void initPlayer();
void initBee();
void initBerry();
void initFlowers();
void updateGame();
void updatePlayer();
void updateBee();
void updateBerry();
void updateFlowers(FLOWER* f);
void drawGame();
void drawPlayer();
void drawGameBee();
void drawFlowers(FLOWER* f);