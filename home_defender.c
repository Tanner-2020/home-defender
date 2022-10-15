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

