#include <gb/gb.h>

typedef struct sprite {
    UBYTE spriteIDs[4];
    uint8_t x;
    uint8_t y;
    uint8_t width;
    uint8_t height;
    uint8_t hp;
    int8_t speed;
}sprite;