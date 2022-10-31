/***************************************************************************
 *                                                                         *
 * Project Name : Home Defender                                            *
 *                                                                         *
 * Purpose : Create a functional GameBoy game with the capability to run   *
 * on original hardware.                                                   *
 *                                                                         *
 * Version : 1.0, Started 10/14/2022                                       *
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
uint8_t life;
uint8_t earthHealth;
uint16_t hiScore;
uint16_t currScore;
uint8_t quakeIter;
UBYTE lostLife;

// Sprites
sprite maverick;
sprite shot1;
sprite shot2;
sprite missile;
sprite asteroid1;
sprite asteroid2;


void setUpSprites(){

    // Player
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
    maverick.speed = 3;

    // Shot 1
    set_sprite_tile(4, 6);
    shot1.spriteIDs[0] = 4;
    set_sprite_tile(5, 7);
    shot1.spriteIDs[1] = 5;
    shot1.x = 0;
    shot1.y = 0;
    shot1.width = 16;
    shot1.height = 8;
    shot1.hp = 1;
    shot1.speed = 5;

    // Shot 2
    set_sprite_tile(6, 8);
    shot2.spriteIDs[0] = 6;
    set_sprite_tile(7, 9);
    shot2.spriteIDs[1] = 7;
    shot2.x = 0;
    shot2.y = 0;
    shot2.width = 16;
    shot2.height = 8;
    shot2.hp = 1;
    shot2.speed = 5;

    // Missile
    set_sprite_tile(8, 10);
    missile.spriteIDs[0] = 8;
    set_sprite_tile(9, 11);
    missile.spriteIDs[2] = 9;
    missile.x = 0;
    missile.y = 0;
    missile.width = 8;
    missile.height = 16;
    missile.hp = 3;
    missile.speed = 2;

    // Asteroid 1
    set_sprite_tile(10, 12);
    asteroid1.spriteIDs[0] = 10;
    set_sprite_tile(11, 13);
    asteroid1.spriteIDs[1] = 11;
    set_sprite_tile(12, 14);
    asteroid1.spriteIDs[2] = 12;
    set_sprite_tile(13, 15);
    asteroid1.spriteIDs[3] = 13;
    asteroid1.x = 0;
    asteroid1.y = 0;
    asteroid1.width = 16;
    asteroid1.height = 16;
    asteroid1.hp = 3;
    asteroid1.speed = 3;

    // Asteroid 2
    set_sprite_tile(14, 16);
    asteroid2.spriteIDs[0] = 14;
    set_sprite_tile(15, 17);
    asteroid2.spriteIDs[1] = 15;
    set_sprite_tile(16, 18);
    asteroid2.spriteIDs[2] = 16;
    set_sprite_tile(17, 19);
    asteroid2.spriteIDs[3] = 17;
    asteroid2.x = 0;
    asteroid2.y = 0;
    asteroid2.width = 16;
    asteroid2.height = 16;
    asteroid2.hp = 3;
    asteroid2.speed = 3;
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


void resetSprites(){
    // Player
    maverick.x = 0;
    maverick.y = 0;
    moveSprites(&maverick, 0, 0);

    // Shot 1
    shot1.x = 0;
    shot1.y = 0;
    moveSprites(&shot1, 0, 0);

    // Shot 2
    shot2.x = 0;
    shot2.y = 0;
    moveSprites(&shot2, 0, 0);

    // Missile
    missile.x = 0;
    missile.y = 0;
    moveSprites(&missile, 0, 0);

    // Asteroid 1
    asteroid1.x = 0;
    asteroid1.y = 0;
    moveSprites(&asteroid1, 0, 0);

    // Asteroid 2
    asteroid2.x = 0;
    asteroid2.y = 0;
    moveSprites(&asteroid2, 0, 0);

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
        NR10_REG = 0x15;
        NR11_REG = 0xC0;
        NR12_REG = 0x24;
        NR13_REG = 0x73;
        NR14_REG = 0x86;
        
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


void printScore(UBYTE isInGame, UBYTE isHighScore){
    uint8_t currScoreKeeper[5];
    uint16_t scoreKeeper;
    uint16_t remainder;

    if(isInGame == 1 || isHighScore != 1){
        scoreKeeper = currScore;
        currScoreKeeper[0] = 1 + (scoreKeeper/10000);
        remainder = scoreKeeper - ((scoreKeeper/10000)*10000);
        scoreKeeper = remainder;
        currScoreKeeper[1] = 1 + (scoreKeeper/1000);
        remainder = scoreKeeper - ((scoreKeeper/1000)*1000);
        scoreKeeper = remainder;
        currScoreKeeper[2] = 1 + (scoreKeeper/100);
        remainder = scoreKeeper - ((scoreKeeper/100)*100);
        scoreKeeper = remainder;
        currScoreKeeper[3] = 1 + (scoreKeeper/10);
        remainder = scoreKeeper - ((scoreKeeper/10)*10);
        currScoreKeeper[4] = 1 + (currScore %10);

        if(isInGame == 1){
            set_win_tiles(15, 0, 5, 1, currScoreKeeper);
        }
        if(isHighScore != 1){
            set_bkg_tiles(6, 10, 5, 1, currScoreKeeper);
        }
    }
    else{
        scoreKeeper = hiScore;
        currScoreKeeper[0] = 1 + (scoreKeeper/10000);
        remainder = scoreKeeper - ((scoreKeeper/10000)*10000);
        scoreKeeper = remainder;
        currScoreKeeper[1] = 1 + (scoreKeeper/1000);
        remainder = scoreKeeper - ((scoreKeeper/1000)*1000);
        scoreKeeper = remainder;
        currScoreKeeper[2] = 1 + (scoreKeeper/100);
        remainder = scoreKeeper - ((scoreKeeper/100)*100);
        scoreKeeper = remainder;
        currScoreKeeper[3] = 1 + (scoreKeeper/10);
        remainder = scoreKeeper - ((scoreKeeper/10)*10);
        currScoreKeeper[4] = 1 + (hiScore %10);
        set_bkg_tiles(6, 6, 5, 1, currScoreKeeper);
    }
}


void updateWin(UBYTE destroyed){
    uint8_t health[3];
    uint8_t playerLives[1];
    uint16_t loop;
    uint16_t remainder;

    if(destroyed == 1){
        life--;
    }
    if(life < 100){
        playerLives[0] = 1 + life;
        set_win_tiles(3, 0, 1, 1, playerLives);
    }

    if(earthHealth < 100){
        health[0] = 1;
        for(loop = 0; loop <= earthHealth + 5; loop += 10){
            if(earthHealth % loop < 10){
                health[1] = 1 + (loop/10);
                if(earthHealth == 5){
                    health[1] = 1;
                }
                remainder = earthHealth % loop;
                health[2] = 1 + remainder;
            }
        }
        set_win_tiles(6, 0, 3, 1, health);
    }
    printScore(1, 1);
}


void checkCollisions(sprite *obj1, sprite *obj2, uint8_t *cooldown){
    if(obj1->x != 0 && obj1->y != 0){
        if(((obj1->x >= obj2->x && obj1->x <= obj2->x+obj2->width) && (obj1->y >= obj2->y && obj1->y <= obj2->y+obj2->height)) ||
        ((obj2->x >= obj1->x && obj2->x <= obj1->x+obj1->width) && (obj2->y >= obj1->y && obj2->y <= obj1->y+obj1->height))){
            if(obj1->width < 16){
                obj2->hp = 0;
                currScore += 20;
                obj1->x = 0;
                obj1->y = 0;
                moveSprites(obj1, 0, 0);
                updateWin(0);
            }
            if(obj1-> height < 16){
                currScore += 5;
                obj2->hp = obj2->hp - obj1->hp;
                obj1->x = 0;
                obj1->y = 0;
                moveSprites(obj1, 0, 0);
                updateWin(0);
            }
            if(obj1->height == 16 && obj1->width == 16){
                currScore += 5;
                obj2->hp = 0;
                obj1->x = 80;
                lostLife = 1;
                playSounds(9);
                moveSprites(obj1, 0, 0);
                updateWin(0);
            }
            
            if(obj2->hp == 0){
                playSounds(7);
                *cooldown = 0;
                obj2->x = 0;
                obj2->y = 0;
                obj2->hp = 3;
                moveSprites(obj2, 0, 0);
            }
        }
    }
}

void earthquake(UBYTE fin, UBYTE *earthHit){
    if(fin == 0){
        if(quakeIter == 0){
            playSounds(8);
        }
        if(quakeIter == 0 || quakeIter == 12){
            scroll_bkg(8,0);
        }
        if(quakeIter == 3 || quakeIter == 15){
            scroll_bkg(-16,0);
        }
        if(quakeIter == 6 || quakeIter == 18){
            scroll_bkg(16,0);
        }
        if(quakeIter == 9 || quakeIter == 21){
            scroll_bkg(-8,0);
        }
        quakeIter++;
        if(quakeIter >= 21){
            scroll_bkg(-8,0);
            quakeIter = 0;
            *earthHit = 0;
        }
    }
    else{
        uint8_t quake;
        for(quake = 0; quake < 22; quake++){
            quakeIter = quake;

            if(quakeIter == 0){
                playSounds(8);
            }
            if(quakeIter == 0 || quakeIter == 12){
                scroll_bkg(8,0);
            }
            if(quakeIter == 3 || quakeIter == 15){
                scroll_bkg(-16,0);
            }
            if(quakeIter == 6 || quakeIter == 18){
                scroll_bkg(16,0);
            }
            if(quakeIter == 9 || quakeIter == 21){
                scroll_bkg(-8,0);
            }
            quakeIter++;
            if(quakeIter >= 21){
                scroll_bkg(0, 0);
                quakeIter = 0;
                earthHit = 0;
            }
            performanceDelay(2);
        }
    }
}


void startScreen(){
    SHOW_BKG;

    waitpad(J_START);
    playSounds(0);
    performanceDelay(4);
}


void playGame(){
    earthHealth = 100;
    currScore = 0;
    UBYTE earthHit = 0;
    lostLife = 0;
    uint8_t blastDelay = 10;
    uint16_t missileDelay = 900;
    life = 3;
    uint8_t a1Cooldown = 30;
    uint8_t a2Cooldown = 50;
    uint8_t difficulty = 0;
    uint8_t clock = 0;

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
        if(joypad() & J_RIGHT && maverick.x < 151){
            moveSprites(&maverick, maverick.speed, 0);
        }
        if(joypad() & J_A && blastDelay == 10){
            playSounds(3);
            blastDelay = 0;
            if((shot1.x == 0 && shot1.y == 0)||(shot1.x != 0 && shot2.y != 0)){
                moveSprites(&shot1, maverick.x, maverick.y);
            }
            else{
                moveSprites(&shot2, maverick.x, maverick.y);
            }
        }
        if(joypad() & J_B){
            if(missileDelay == 900){
                playSounds(4);
                missileDelay = 0;
                moveSprites(&missile, maverick.x + 4, maverick.y);
            }
            else if(missileDelay < 900 && missileDelay >= 50 && missileDelay % 3 == 0){
                playSounds(6);
            }
        }
        if(joypad() & J_START){
            performanceDelay(10);
            waitpad(J_START);
            performanceDelay(10);
        }
        if(joypad() & J_SELECT){
            life = 4;
        }

        if(shot1.x != 0 && shot1.y != 0){
            moveSprites(&shot1, 0, -(shot1.speed));
            if(shot1.y == 0){
                shot1.x = 0;
                shot1.y = 0;
                moveSprites(&shot1, 0, 0);
            }
        }
        if(shot2.x != 0 && shot2.y != 0){
            moveSprites(&shot2, 0, -(shot2.speed));
            if(shot2.y == 0){
                shot2.x = 0;
                shot2.y = 0;
                moveSprites(&shot2, 0, 0);
            }
        }
        if(missile.x != 0 && missile.y != 0){
            moveSprites(&missile, 0, -(missile.speed));
            if(missile.y == 0){
                missile.x = 0;
                missile.y = 0;
                moveSprites(&missile, 0, 0);
            }
        }
        if(a1Cooldown == 30){
            if(asteroid1.x == 0){
                asteroid1.x = (rand()%148)+8;
            }
            else if(asteroid1.x != 0 && asteroid1.y < 116 && clock % asteroid2.speed == 0){
                moveSprites(&asteroid1, 0, 2);
            }
            else if(asteroid1.y == 116){
                a1Cooldown = 0;
                earthHealth = earthHealth - 5;
                updateWin(0);
                asteroid1.x = 0;
                asteroid1.y = 0;
                earthHit = 1;
                moveSprites(&asteroid1, 0, 0);
            }
        }
        else{
            a1Cooldown++;
        }
        if(a2Cooldown == 50){
            if(asteroid2.x == 0 && asteroid1.y >= 40){
                uint8_t spawn = (rand()%148)+8;
                if(spawn > asteroid1.x + 24 || spawn < asteroid1.x - 8){
                    asteroid2.x = spawn;
                }
            }
            else if(asteroid2.x != 0 && asteroid2.y < 116 && clock % asteroid2.speed == 0){
                moveSprites(&asteroid2, 0, 2);
            }
            else if(asteroid2.y == 116){
                if(asteroid2.x != 0){
                    a2Cooldown = 0;
                    earthHealth = earthHealth - 5;
                    updateWin(0);
                    asteroid2.x = 0;
                    asteroid2.y = 0;
                    earthHit =1;
                    moveSprites(&asteroid2, 0, 0);
                }
            }
        }
        else{
            a2Cooldown++;
        }

        if(blastDelay < 10){
            blastDelay++;
        }
        if(missileDelay < 900){
            missileDelay++;
            if(missileDelay == 900){
                playSounds(5);
            }
        }

        checkCollisions(&maverick, &asteroid1, &a1Cooldown);
        checkCollisions(&maverick, &asteroid2, &a2Cooldown);
        checkCollisions(&shot1, &asteroid1, &a1Cooldown);
        checkCollisions(&shot1, &asteroid2, &a2Cooldown);
        checkCollisions(&shot2, &asteroid1, &a1Cooldown);
        checkCollisions(&shot2, &asteroid2, &a2Cooldown);
        checkCollisions(&missile, &asteroid1, &a1Cooldown);
        checkCollisions(&missile, &asteroid2, &a2Cooldown);

        if(lostLife == 1){
            updateWin(1);
            lostLife = 0;
        }

        if(currScore >= 500 && currScore < 1000){
            asteroid2.speed = 2;
        }
        if(currScore >= 1000 && currScore < 3300){
            asteroid1.speed = 2;
        }
        if(currScore >= 3300 && currScore < 5000){
            asteroid2.speed = 1;
        }
        if(currScore >= 5000){
            asteroid1.speed = 1;
        }

        if(earthHit == 1 && earthHealth > 0 && earthHealth < 100){
            earthquake(0, &earthHit);
        }
        else if(earthHit == 1 && (earthHealth > 100 || earthHealth == 0)){
            earthquake(1, &earthHit);
        }

        clock++;
        performanceDelay(2);
    }

    if(currScore > hiScore){
        hiScore = currScore;
    }

    waitpad(J_A);
    resetSprites();
}


void displayStats(){
    uint8_t numPlaysKeeper[3];
    uint16_t playsKeeper;
    uint16_t remainder;

    fadeOut();
    set_bkg_tiles(0, 0, 20, 18, stats_screen);
    move_bkg(0, 0);
    printScore(0, 0);
    printScore(0, 1);

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

    waitpad(J_A);

    playSounds(2);
    fadeTransition(97, bkg, menu_screen);

}


void menuSelection(){
    uint8_t selection;
    uint8_t cursorPos;
    fadeTransition(98, bkg, menu_screen);

    set_sprite_data(0, 20, sprites);
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