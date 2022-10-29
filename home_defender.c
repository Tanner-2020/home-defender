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
#include "sprite_sheet.c"
#include "bkg_sprites.c"
#include "menu_screen.c"
#include "stats_screen.c"
#include "game_screen.c"
#include "hud.c"


// Global Variables
uint8_t numplays;
uint8_t hiScore;
uint8_t currScore;

// Sprites
sprite maverick;
sprite bolt1;
sprite bolt2;
sprite missile;
sprite asteroid1;
sprite asteroid2;


void setUpSprites(){

    //Player
    set_sprite_tile(0, 2);
    maverick.spriteIDs[0] = 0;
    set_sprite_tile(1, 3);
    maverick.spriteIDs[1] = 1;
    set_sprite_tile(2, 4);
    maverick.spriteIDs[2] = 2;
    set_sprite_tile(3, 5);
    maverick.spriteIDs[3] = 3;
    maverick.x = 0;
    maverick.y = 0;
    maverick.width = 16;
    maverick.height = 16;
    maverick.hp = 3;
    maverick.speed = 4;
}


void moveSprites(sprite* object, uint8_t x, uint8_t y){
    move_sprite(object->spriteIDs[0], object->x + x, object->y + y);
    if(object->width == 16){
        move_sprite(object->spriteIDs[1], object->x + 8 + x, object->y + y);
    }
    if(object->height == 16){
        move_sprite(object->spriteIDs[2], object->x + x, object->y + 8 + y);
    }
    if(object->width == 16 && object->height == 16){
        move_sprite(object->spriteIDs[3], object->x + 8 + x, object->y + 8 + y);
    }
    object->x += x;
    object->y += y;
}


void performanceDelay(uint8_t num){
    uint8_t i;
    for(i = 0; i < num; i++){
        wait_vbl_done();
    }
}


void fadeOut(){
    uint8_t i;
    for(i = 0; i < 4; i++){
        switch(i){
            case 0:
                BGP_REG = 0xE4;
                break;
            case 1:
                BGP_REG = 0xF9;
                break;
            case 2:
                BGP_REG = 0xFE;
                break;
            case 3:
                BGP_REG = 0xFF;
                break;
        }
        performanceDelay(3);
    }
}


void fadeIn(){
    uint8_t i;
    for(i = 0; i < 3; i++){
        switch(i){
            case 0:
                BGP_REG = 0xFE;
                break;
            case 1:
                BGP_REG = 0xF9;
                break;
            case 2:
                BGP_REG = 0xE4;
                break;
        }
        performanceDelay(3);
    }
}


void fadeTransition(uint8_t num, char* data, char* tiles){
    fadeOut();
    set_bkg_data(0, num, data);
    set_bkg_tiles(0, 0, 20, 18, tiles);
    fadeIn();
}


void playSounds(uint8_t soundVal){
    if(soundVal == 0){
        // Sound for A/Start press in menu.
        NR10_REG = 0x25;
        NR11_REG = 0x86;
        NR12_REG = 0x36;
        NR13_REG = 0x72;
        NR14_REG = 0x86;
    }
    if(soundVal == 1){
        // Sound for Cursor movement in menu.
        NR10_REG = 0x15;
        NR11_REG = 0xC0;
        NR12_REG = 0x24;
        NR13_REG = 0x73;
        NR14_REG = 0x86;
    }
    if(soundVal == 2){
        // Sound for Back-press in menu.
        NR10_REG = 0x2D;
        NR11_REG = 0x86;
        NR12_REG = 0x36;
        NR13_REG = 0x72;
        NR14_REG = 0x86;
    }
    if(soundVal == 3){
        // Sound for Standard Blast within Game.
        NR10_REG = 0x4D;
        NR11_REG = 0xCF;
        NR12_REG = 0x64;
        NR13_REG = 0xFA;
        NR14_REG = 0x86;
    }
    if(soundVal == 4){
        // Sound for Missile Blast within Game.
        NR41_REG = 0x03;
        NR42_REG = 0xE7;
        NR43_REG = 0xA8;
        NR44_REG = 0x80;
    }
    if(soundVal == 5){
        // Sound for Missile Recharge within Game.
        NR21_REG = 0xCA;
        NR22_REG = 0x83;
        NR23_REG = 0xD7;
        NR24_REG = 0xC6;
    }
    if(soundVal == 6){
        // Sound for Failed Missile Launch within Game.
        NR41_REG = 0x3A;
        NR42_REG = 0xA1;
        NR43_REG = 0x00;
        NR44_REG = 0xC0;
    }
    if(soundVal == 7){
        // Sound for Asteroid Destruction within Game.

    }
    if(soundVal == 8){
        // Sound for Asteroid Collision with Planet.
        NR41_REG = 0x00;
        NR42_REG = 0xD6;
        NR43_REG = 0x37;
        NR44_REG = 0x80;
    }
    if(soundVal == 9){
        // Sound for Ship Respawn
        // TODO: Change sound to unique sound.
        NR21_REG = 0xCA;
        NR22_REG = 0x83;
        NR23_REG = 0xD7;
        NR24_REG = 0xC6;
    }
}


void startScreen(){
    SHOW_BKG;

    waitpad(J_START);
    playSounds(0);
    performanceDelay(4);
}


void playGame(){
    uint8_t earthHealth = 100;
    currScore = 0;
    UBYTE earthHit = 0;
    uint8_t blastDelay = 10;
    uint16_t missileDelay = 900;
    uint8_t life = 3;

    //Specialized Fade Transition to Game (Includes background offset)
    fadeOut();
    set_bkg_tiles(0, 0, 28, 18, game_screen);
    move_bkg(32, 0);
    set_win_data(0, 97, bkg);
    set_win_tiles(0, 0, 20, 1, hud);
    move_win(8, 134);
    SHOW_WIN;
    setUpSprites();
    moveSprites(&maverick, 80, 100);
    fadeIn();

    while(earthHealth > 0 && life < 4){
        if(joypad() & J_LEFT && maverick.x > 9){
            moveSprites(&maverick, -(maverick.speed), 0);
        }
        if (joypad() & J_RIGHT && maverick.x < 151){
            moveSprites(&maverick, maverick.speed, 0);
        }
        if(joypad() & J_SELECT){
            life = 4;
        }

        performanceDelay(2);
    }

    if(currScore > hiScore){
        hiScore = currScore;
    }

    waitpad(J_A);
    //resetSprites();
}


void displayStats(){
    uint8_t numPlaysKeeper[3];
    uint16_t playsKeeper;
    uint16_t remainder;

    fadeOut();
    set_bkg_tiles(0, 0, 20, 18, stats_screen);
    move_bkg(0, 0);
    //printScore(0, 0);
    //printScore(0, 1);

    playsKeeper = numplays;
    numPlaysKeeper[0] = 1 + (playsKeeper/100);
    remainder = playsKeeper - ((playsKeeper/100)*100);
    playsKeeper = remainder;
    numPlaysKeeper[1] = 1 + (playsKeeper/10);
    remainder = playsKeeper - ((playsKeeper/10)*10);
    numPlaysKeeper[2] = 1 + (numplays %10);
    set_bkg_tiles(6, 14, 3, 1, numPlaysKeeper);

    HIDE_WIN;
    fadeIn();

    waitpad(J_B);

    playSounds(2);
    fadeTransition(97, bkg, menu_screen);

}


void menuSelection(){
    uint8_t selection;
    uint8_t cursorPos;
    fadeTransition(98, bkg, menu_screen);

    set_sprite_data(0, 19, sprites);
    set_sprite_tile(0, 1);
    move_sprite(0, 40, 48);

    SHOW_SPRITES;

    selection = 0;
    cursorPos = 0;

    while(selection != 3){

        if(joypad() & J_DOWN){
            cursorPos++;
            if(cursorPos > 1){ cursorPos = 0; }
            playSounds(1);
            move_sprite(0, 40, 48 + (cursorPos*16));
            performanceDelay(10);
        }
        if(joypad() & J_UP){
            cursorPos--;
            if(cursorPos > 1){ cursorPos = 1; }
            playSounds(1);
            move_sprite(0, 40, 48+(cursorPos*16));
            performanceDelay(10);
        }
        if(joypad() & J_B){
            playSounds(2);
            selection = 3;
        }
        if(joypad() & J_A){
            playSounds(0);
            if(cursorPos == 0){ selection = 1; }
            if(cursorPos == 1){ selection = 2; }
        }

        if(selection != 0 && selection != 3){
            move_sprite(0, 0, 0);
            if(selection == 1){
                numplays++;
                playGame();
                displayStats();
            }
            if(selection == 2){
                displayStats();
            }
            set_sprite_data(0, 19, sprites);
            set_sprite_tile(0, 1);
            move_sprite(0, 40, 48);
            cursorPos = 0;
            selection = 0;
            performanceDelay(10);
        }
        if(selection == 3){ move_sprite(0, 0, 0); }
    }
}


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

        startScreen();

        uint16_t seed;
        seed = DIV_REG;
        seed |= (uint16_t)DIV_REG << 8;
        initarand(seed);

        menuSelection();

        fadeTransition(172, start_data, start_map);
    }
}