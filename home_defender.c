/***************************************************************************
 *                                                                         *
 * Project Name : Home Defender                                            *
 *                                                                         *
 * Purpose : Create a functional GameBoy game with the capability to run   *
 * on original hardware.                                                   *
 *                                                                         *
 * Version : 3.0, Started 10/14/2022                                       *
 *                                                                         *
 * Author : Tanner Hall                                                    *
 *                                                                         *
 **************************************************************************/

// Base C Libraries
#include <gb/gb.h>
#include <stdint.h>
#include <rand.h>
#include <stdio.h>


// Included C Files
#include "start_data.c"
#include "start_map.c"
#include "sprite.c"
#include "bkg_sprites.c"
#include "menu_screen.c"
#include "stats_screen.c"
#include "game_screen.c"


// Global Variables
uint8_t numplays;

void main(){

    //Enable Sound Profile
    NR52_REG = 0x80;
    NR50_REG = 0x77;
    NR51_REG = 0xFF;

    set_bkg_data(0, 172, start_data);
    set_bkg_tiles(0, 0, 20, 18, start_map);
    DISPLAY_ON;
    numplays = 0;

    while(1){

        //startScreen();

        uint16_t seed;
        seed = DIV_REG;
        seed |= (uint16_t)DIV_REG << 8;
        initarand(seed);

        //menuSelection();

        //fadeTransition();
    }
}