;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module home_defender
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _menuSelection
	.globl _displayStats
	.globl _playGame
	.globl _startScreen
	.globl _earthquake
	.globl _checkCollisions
	.globl _updateWin
	.globl _printScore
	.globl _playSounds
	.globl _fadeTransition
	.globl _fadeIn
	.globl _fadeOut
	.globl _performanceDelay
	.globl _resetSprites
	.globl _moveSprites
	.globl _setUpSprites
	.globl _initarand
	.globl _rand
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_win_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _waitpad
	.globl _joypad
	.globl _asteroid2
	.globl _asteroid1
	.globl _missile
	.globl _shot2
	.globl _shot1
	.globl _maverick
	.globl _lostLife
	.globl _quakeIter
	.globl _currScore
	.globl _hiScore
	.globl _earthHealth
	.globl _life
	.globl _numplays
	.globl _hud
	.globl _game_screen
	.globl _stats_screen
	.globl _menu_screen
	.globl _bkg
	.globl _sprites
	.globl _start_map
	.globl _start_data
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_numplays::
	.ds 1
_life::
	.ds 1
_earthHealth::
	.ds 1
_hiScore::
	.ds 2
_currScore::
	.ds 2
_quakeIter::
	.ds 1
_lostLife::
	.ds 1
_maverick::
	.ds 10
_shot1::
	.ds 10
_shot2::
	.ds 10
_missile::
	.ds 10
_asteroid1::
	.ds 10
_asteroid2::
	.ds 10
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;home_defender.c:51: void setUpSprites(){
;	---------------------------------
; Function setUpSprites
; ---------------------------------
_setUpSprites::
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x02
;home_defender.c:55: maverick.spriteIDs[0] = 0;
	ld	hl, #_maverick
	ld	(hl), #0x00
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x03
;home_defender.c:57: maverick.spriteIDs[1] = 1;
	ld	hl, #(_maverick + 1)
	ld	(hl), #0x01
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x04
;home_defender.c:59: maverick.spriteIDs[2] = 2;
	ld	hl, #(_maverick + 2)
	ld	(hl), #0x02
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x05
;home_defender.c:61: maverick.spriteIDs[3] = 3;
	ld	hl, #(_maverick + 3)
	ld	(hl), #0x03
;home_defender.c:62: maverick.x = 0;
	ld	hl, #(_maverick + 4)
	ld	(hl), #0x00
;home_defender.c:63: maverick.y = 0;
	ld	hl, #(_maverick + 5)
	ld	(hl), #0x00
;home_defender.c:64: maverick.width = 16;
	ld	hl, #(_maverick + 6)
	ld	(hl), #0x10
;home_defender.c:65: maverick.height = 16;
	ld	hl, #(_maverick + 7)
	ld	(hl), #0x10
;home_defender.c:66: maverick.hp = 3;
	ld	hl, #(_maverick + 8)
	ld	(hl), #0x03
;home_defender.c:67: maverick.speed = 3;
	ld	hl, #(_maverick + 9)
	ld	(hl), #0x03
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x06
;home_defender.c:71: shot1.spriteIDs[0] = 4;
	ld	hl, #_shot1
	ld	(hl), #0x04
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x07
;home_defender.c:73: shot1.spriteIDs[1] = 5;
	ld	hl, #(_shot1 + 1)
	ld	(hl), #0x05
;home_defender.c:74: shot1.x = 0;
	ld	hl, #(_shot1 + 4)
	ld	(hl), #0x00
;home_defender.c:75: shot1.y = 0;
	ld	hl, #(_shot1 + 5)
	ld	(hl), #0x00
;home_defender.c:76: shot1.width = 16;
	ld	hl, #(_shot1 + 6)
	ld	(hl), #0x10
;home_defender.c:77: shot1.height = 8;
	ld	hl, #(_shot1 + 7)
	ld	(hl), #0x08
;home_defender.c:78: shot1.hp = 1;
	ld	hl, #(_shot1 + 8)
	ld	(hl), #0x01
;home_defender.c:79: shot1.speed = 5;
	ld	hl, #(_shot1 + 9)
	ld	(hl), #0x05
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), #0x08
;home_defender.c:83: shot2.spriteIDs[0] = 6;
	ld	hl, #_shot2
	ld	(hl), #0x06
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), #0x09
;home_defender.c:85: shot2.spriteIDs[1] = 7;
	ld	hl, #(_shot2 + 1)
	ld	(hl), #0x07
;home_defender.c:86: shot2.x = 0;
	ld	hl, #(_shot2 + 4)
	ld	(hl), #0x00
;home_defender.c:87: shot2.y = 0;
	ld	hl, #(_shot2 + 5)
	ld	(hl), #0x00
;home_defender.c:88: shot2.width = 16;
	ld	hl, #(_shot2 + 6)
	ld	(hl), #0x10
;home_defender.c:89: shot2.height = 8;
	ld	hl, #(_shot2 + 7)
	ld	(hl), #0x08
;home_defender.c:90: shot2.hp = 1;
	ld	hl, #(_shot2 + 8)
	ld	(hl), #0x01
;home_defender.c:91: shot2.speed = 5;
	ld	hl, #(_shot2 + 9)
	ld	(hl), #0x05
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), #0x0a
;home_defender.c:95: missile.spriteIDs[0] = 8;
	ld	hl, #_missile
	ld	(hl), #0x08
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), #0x0b
;home_defender.c:97: missile.spriteIDs[2] = 9;
	ld	hl, #(_missile + 2)
	ld	(hl), #0x09
;home_defender.c:98: missile.x = 0;
	ld	hl, #(_missile + 4)
	ld	(hl), #0x00
;home_defender.c:99: missile.y = 0;
	ld	hl, #(_missile + 5)
	ld	(hl), #0x00
;home_defender.c:100: missile.width = 8;
	ld	hl, #(_missile + 6)
	ld	(hl), #0x08
;home_defender.c:101: missile.height = 16;
	ld	hl, #(_missile + 7)
	ld	(hl), #0x10
;home_defender.c:102: missile.hp = 3;
	ld	hl, #(_missile + 8)
	ld	(hl), #0x03
;home_defender.c:103: missile.speed = 2;
	ld	hl, #(_missile + 9)
	ld	(hl), #0x02
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 42)
	ld	(hl), #0x0c
;home_defender.c:107: asteroid1.spriteIDs[0] = 10;
	ld	hl, #_asteroid1
	ld	(hl), #0x0a
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 46)
	ld	(hl), #0x0d
;home_defender.c:109: asteroid1.spriteIDs[1] = 11;
	ld	hl, #(_asteroid1 + 1)
	ld	(hl), #0x0b
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 50)
	ld	(hl), #0x0e
;home_defender.c:111: asteroid1.spriteIDs[2] = 12;
	ld	hl, #(_asteroid1 + 2)
	ld	(hl), #0x0c
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 54)
	ld	(hl), #0x0f
;home_defender.c:113: asteroid1.spriteIDs[3] = 13;
	ld	hl, #(_asteroid1 + 3)
	ld	(hl), #0x0d
;home_defender.c:114: asteroid1.x = 0;
	ld	hl, #(_asteroid1 + 4)
	ld	(hl), #0x00
;home_defender.c:115: asteroid1.y = 0;
	ld	hl, #(_asteroid1 + 5)
	ld	(hl), #0x00
;home_defender.c:116: asteroid1.width = 16;
	ld	hl, #(_asteroid1 + 6)
	ld	(hl), #0x10
;home_defender.c:117: asteroid1.height = 16;
	ld	hl, #(_asteroid1 + 7)
	ld	(hl), #0x10
;home_defender.c:118: asteroid1.hp = 3;
	ld	hl, #(_asteroid1 + 8)
	ld	(hl), #0x03
;home_defender.c:119: asteroid1.speed = 3;
	ld	hl, #(_asteroid1 + 9)
	ld	(hl), #0x03
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 58)
	ld	(hl), #0x10
;home_defender.c:123: asteroid2.spriteIDs[0] = 14;
	ld	hl, #_asteroid2
	ld	(hl), #0x0e
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 62)
	ld	(hl), #0x11
;home_defender.c:125: asteroid2.spriteIDs[1] = 15;
	ld	hl, #(_asteroid2 + 1)
	ld	(hl), #0x0f
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 66)
	ld	(hl), #0x12
;home_defender.c:127: asteroid2.spriteIDs[2] = 16;
	ld	hl, #(_asteroid2 + 2)
	ld	(hl), #0x10
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 70)
	ld	(hl), #0x13
;home_defender.c:129: asteroid2.spriteIDs[3] = 17;
	ld	hl, #(_asteroid2 + 3)
	ld	(hl), #0x11
;home_defender.c:130: asteroid2.x = 0;
	ld	hl, #(_asteroid2 + 4)
	ld	(hl), #0x00
;home_defender.c:131: asteroid2.y = 0;
	ld	hl, #(_asteroid2 + 5)
	ld	(hl), #0x00
;home_defender.c:132: asteroid2.width = 16;
	ld	hl, #(_asteroid2 + 6)
	ld	(hl), #0x10
;home_defender.c:133: asteroid2.height = 16;
	ld	hl, #(_asteroid2 + 7)
	ld	(hl), #0x10
;home_defender.c:134: asteroid2.hp = 3;
	ld	hl, #(_asteroid2 + 8)
	ld	(hl), #0x03
;home_defender.c:135: asteroid2.speed = 3;
	ld	hl, #(_asteroid2 + 9)
	ld	(hl), #0x03
;home_defender.c:136: }
	ret
_start_data:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xf0	; 240
	.db #0x13	; 19
	.db #0xe0	; 224
	.db #0x13	; 19
	.db #0xe0	; 224
	.db #0xe7	; 231
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x0c	; 12
	.db #0xe3	; 227
	.db #0x1c	; 28
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xc7	; 199
	.db #0x38	; 56	'8'
	.db #0xcf	; 207
	.db #0x30	; 48	'0'
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xc1	; 193
	.db #0x3e	; 62
	.db #0xc0	; 192
	.db #0x3c	; 60
	.db #0x84	; 132
	.db #0x78	; 120	'x'
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0xc1	; 193
	.db #0x3e	; 62
	.db #0xc1	; 193
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x7c	; 124
	.db #0x03	; 3
	.db #0x7c	; 124
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0xbf	; 191
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x60	; 96
	.db #0x93	; 147
	.db #0x60	; 96
	.db #0xc7	; 199
	.db #0x30	; 48	'0'
	.db #0xcf	; 207
	.db #0x30	; 48	'0'
	.db #0xdf	; 223
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0xc1	; 193
	.db #0x7c	; 124
	.db #0x83	; 131
	.db #0x7c	; 124
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf1	; 241
	.db #0x0e	; 14
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x3e	; 62
	.db #0x01	; 1
	.db #0xcf	; 207
	.db #0x30	; 48	'0'
	.db #0x8f	; 143
	.db #0x70	; 112	'p'
	.db #0x9f	; 159
	.db #0x60	; 96
	.db #0x9f	; 159
	.db #0x60	; 96
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x78	; 120	'x'
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x11	; 17
	.db #0xe0	; 224
	.db #0xe3	; 227
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x07	; 7
	.db #0xf9	; 249
	.db #0x06	; 6
	.db #0xf9	; 249
	.db #0x06	; 6
	.db #0xf1	; 241
	.db #0x0e	; 14
	.db #0xf3	; 243
	.db #0x0c	; 12
	.db #0xe3	; 227
	.db #0x1c	; 28
	.db #0xe3	; 227
	.db #0x1c	; 28
	.db #0xc7	; 199
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x0c	; 12
	.db #0xf3	; 243
	.db #0x0c	; 12
	.db #0xf3	; 243
	.db #0x0c	; 12
	.db #0xe3	; 227
	.db #0x1c	; 28
	.db #0xe0	; 224
	.db #0x1e	; 30
	.db #0xe2	; 226
	.db #0x1c	; 28
	.db #0xc0	; 192
	.db #0x3c	; 60
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfd	; 253
	.db #0x02	; 2
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xf1	; 241
	.db #0x0e	; 14
	.db #0xe3	; 227
	.db #0x1c	; 28
	.db #0x43	; 67	'C'
	.db #0x3c	; 60
	.db #0x47	; 71	'G'
	.db #0x38	; 56	'8'
	.db #0x47	; 71	'G'
	.db #0x38	; 56	'8'
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf1	; 241
	.db #0x0e	; 14
	.db #0xf1	; 241
	.db #0x0e	; 14
	.db #0xf3	; 243
	.db #0x0c	; 12
	.db #0xe3	; 227
	.db #0x1c	; 28
	.db #0xe3	; 227
	.db #0x1c	; 28
	.db #0xc7	; 199
	.db #0x38	; 56	'8'
	.db #0xc7	; 199
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xe1	; 225
	.db #0x1e	; 30
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x02	; 2
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0xc0	; 192
	.db #0x04	; 4
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x78	; 120	'x'
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x38	; 56	'8'
	.db #0x84	; 132
	.db #0x78	; 120	'x'
	.db #0x80	; 128
	.db #0x78	; 120	'x'
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc7	; 199
	.db #0x38	; 56	'8'
	.db #0x80	; 128
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x01	; 1
	.db #0x3e	; 62
	.db #0x01	; 1
	.db #0x3c	; 60
	.db #0x03	; 3
	.db #0x7c	; 124
	.db #0x03	; 3
	.db #0x7c	; 124
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x23	; 35
	.db #0xc0	; 192
	.db #0x27	; 39
	.db #0xc0	; 192
	.db #0x07	; 7
	.db #0xc0	; 192
	.db #0x4f	; 79	'O'
	.db #0x80	; 128
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xe3	; 227
	.db #0x1c	; 28
	.db #0xe3	; 227
	.db #0x1c	; 28
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xc7	; 199
	.db #0x38	; 56	'8'
	.db #0xcf	; 207
	.db #0x30	; 48	'0'
	.db #0xcf	; 207
	.db #0x30	; 48	'0'
	.db #0x8f	; 143
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xf9	; 249
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xe1	; 225
	.db #0x1e	; 30
	.db #0xe2	; 226
	.db #0x1c	; 28
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf1	; 241
	.db #0x0e	; 14
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0xc1	; 193
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0x0f	; 15
	.db #0xc0	; 192
	.db #0x0f	; 15
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xbe	; 190
	.db #0x41	; 65	'A'
	.db #0xbe	; 190
	.db #0x41	; 65	'A'
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x8f	; 143
	.db #0x70	; 112	'p'
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x3e	; 62
	.db #0xc1	; 193
	.db #0x3e	; 62
	.db #0xc1	; 193
	.db #0x7c	; 124
	.db #0x83	; 131
	.db #0x7c	; 124
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x03	; 3
	.db #0xe0	; 224
	.db #0x23	; 35
	.db #0xc0	; 192
	.db #0x27	; 39
	.db #0xc0	; 192
	.db #0x07	; 7
	.db #0xc0	; 192
	.db #0xfd	; 253
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x0c	; 12
	.db #0xe3	; 227
	.db #0x1c	; 28
	.db #0xe3	; 227
	.db #0x1c	; 28
	.db #0xe7	; 231
	.db #0x18	; 24
	.db #0xc7	; 199
	.db #0x38	; 56	'8'
	.db #0xcf	; 207
	.db #0x30	; 48	'0'
	.db #0xcf	; 207
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xe3	; 227
	.db #0x1c	; 28
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xfd	; 253
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xe1	; 225
	.db #0x1e	; 30
	.db #0xe0	; 224
	.db #0x1e	; 30
	.db #0xe2	; 226
	.db #0x1c	; 28
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x3e	; 62
	.db #0xc1	; 193
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x3e	; 62
	.db #0x01	; 1
	.db #0x7c	; 124
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x80	; 128
	.db #0x0f	; 15
	.db #0x80	; 128
	.db #0xbf	; 191
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0x60	; 96
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x44	; 68	'D'
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x14	; 20
	.db #0xe3	; 227
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xcf	; 207
	.db #0x00	; 0
	.db #0xcf	; 207
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf9	; 249
	.db #0xc7	; 199
	.db #0x38	; 56	'8'
	.db #0xc7	; 199
	.db #0x38	; 56	'8'
	.db #0xc7	; 199
	.db #0x38	; 56	'8'
	.db #0x83	; 131
	.db #0x78	; 120	'x'
	.db #0x8b	; 139
	.db #0x70	; 112	'p'
	.db #0x0b	; 11
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf1	; 241
	.db #0x0e	; 14
	.db #0xf1	; 241
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x7e	; 126
	.db #0x40	; 64
	.db #0x3e	; 62
	.db #0x7c	; 124
	.db #0x83	; 131
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x1f	; 31
	.db #0x4f	; 79	'O'
	.db #0x80	; 128
	.db #0x0f	; 15
	.db #0x80	; 128
	.db #0x9f	; 159
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0x70	; 112	'p'
	.db #0x9f	; 159
	.db #0x60	; 96
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x04	; 4
	.db #0xc3	; 195
	.db #0x84	; 132
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x78	; 120	'x'
	.db #0x87	; 135
	.db #0x78	; 120	'x'
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0x13	; 19
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3e	; 62
	.db #0xe0	; 224
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0x18	; 24
	.db #0xe4	; 228
	.db #0x18	; 24
	.db #0x84	; 132
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe7	; 231
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0xf1	; 241
	.db #0xf9	; 249
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xf9	; 249
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x7c	; 124
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0xc6	; 198
	.db #0xe6	; 230
	.db #0xcf	; 207
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xcf	; 207
	.db #0xdf	; 223
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x83	; 131
	.db #0x87	; 135
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x1b	; 27
	.db #0xfd	; 253
	.db #0x1b	; 27
	.db #0xf9	; 249
	.db #0xfb	; 251
	.db #0xf1	; 241
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x8d	; 141
	.db #0x0c	; 12
	.db #0x8d	; 141
	.db #0x7c	; 124
	.db #0x8d	; 141
	.db #0xf8	; 248
	.db #0xfd	; 253
	.db #0x58	; 88	'X'
	.db #0xb9	; 185
	.db #0x1c	; 28
	.db #0x99	; 153
	.db #0x1c	; 28
	.db #0x8d	; 141
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0xc1	; 193
	.db #0xb9	; 185
	.db #0xc1	; 193
	.db #0xfc	; 252
	.db #0xf9	; 249
	.db #0xb8	; 184
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc2	; 194
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x81	; 129
	.db #0xf0	; 240
	.db #0x81	; 129
	.db #0xfd	; 253
	.db #0xfc	; 252
	.db #0x0e	; 14
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xb8	; 184
	.db #0xc0	; 192
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0x84	; 132
	.db #0x7e	; 126
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x0b	; 11
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x86	; 134
	.db #0x03	; 3
	.db #0xe6	; 230
	.db #0xc3	; 195
	.db #0x66	; 102	'f'
	.db #0xe3	; 227
	.db #0xe6	; 230
	.db #0x63	; 99	'c'
	.db #0x66	; 102	'f'
	.db #0xe3	; 227
	.db #0xe6	; 230
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x19	; 25
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x19	; 25
	.db #0x1f	; 31
	.db #0x19	; 25
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x36	; 54	'6'
	.db #0x39	; 57	'9'
	.db #0x70	; 112	'p'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x8c	; 140
	.db #0x18	; 24
	.db #0x8b	; 139
	.db #0x9c	; 156
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0x8a	; 138
	.db #0xdd	; 221
	.db #0xcd	; 205
	.db #0xd8	; 216
	.db #0xec	; 236
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x63	; 99	'c'
	.db #0xe1	; 225
	.db #0x63	; 99	'c'
	.db #0x41	; 65	'A'
	.db #0xe3	; 227
	.db #0xc1	; 193
	.db #0xe3	; 227
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0xe1	; 225
	.db #0xc3	; 195
	.db #0x41	; 65	'A'
	.db #0xe3	; 227
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xce	; 206
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x0b	; 11
	.db #0x07	; 7
	.db #0x2f	; 47
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x03	; 3
	.db #0x2f	; 47
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0x07	; 7
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xf9	; 249
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xd8	; 216
	.db #0xe0	; 224
	.db #0xf9	; 249
	.db #0xfe	; 254
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0x1b	; 27
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x2f	; 47
	.db #0x1f	; 31
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0x5f	; 95
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0xe1	; 225
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0x2f	; 47
	.db #0x1f	; 31
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0x7a	; 122	'z'
	.db #0xfc	; 252
	.db #0x5e	; 94
	.db #0x3f	; 63
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0x74	; 116	't'
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0xbc	; 188
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x5d	; 93
	.db #0x3e	; 62
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0x7c	; 124
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
_start_map:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x23	; 35
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x23	; 35
	.db #0x2d	; 45
	.db #0x23	; 35
	.db #0x2e	; 46
	.db #0x26	; 38
	.db #0x2f	; 47
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x4a	; 74	'J'
	.db #0x4b	; 75	'K'
	.db #0x4c	; 76	'L'
	.db #0x4d	; 77	'M'
	.db #0x4e	; 78	'N'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0x57	; 87	'W'
	.db #0x58	; 88	'X'
	.db #0x59	; 89	'Y'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x5d	; 93
	.db #0x5a	; 90	'Z'
	.db #0x5e	; 94
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x58	; 88	'X'
	.db #0x1e	; 30
	.db #0x5a	; 90	'Z'
	.db #0x62	; 98	'b'
	.db #0x5f	; 95
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x66	; 102	'f'
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0x69	; 105	'i'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6d	; 109	'm'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x78	; 120	'x'
	.db #0x79	; 121	'y'
	.db #0x7a	; 122	'z'
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0x7d	; 125
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x84	; 132
	.db #0x85	; 133
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x86	; 134
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x8a	; 138
	.db #0x8b	; 139
	.db #0x8c	; 140
	.db #0x8a	; 138
	.db #0x8a	; 138
	.db #0x8d	; 141
	.db #0x8e	; 142
	.db #0x8f	; 143
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x8a	; 138
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x96	; 150
	.db #0x97	; 151
	.db #0x98	; 152
	.db #0x99	; 153
	.db #0x8a	; 138
	.db #0x9a	; 154
	.db #0x9b	; 155
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9c	; 156
	.db #0x9d	; 157
	.db #0x9e	; 158
	.db #0x00	; 0
	.db #0x9f	; 159
	.db #0xa0	; 160
	.db #0x8a	; 138
	.db #0x8a	; 138
	.db #0x8a	; 138
	.db #0xa1	; 161
	.db #0xa2	; 162
	.db #0xa3	; 163
	.db #0xa4	; 164
	.db #0xa5	; 165
	.db #0xa6	; 166
	.db #0xa7	; 167
	.db #0xa8	; 168
	.db #0xa9	; 169
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0xab	; 171
_sprites:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x23	; 35
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc4	; 196
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0x23	; 35
	.db #0x22	; 34
	.db #0x63	; 99	'c'
	.db #0x22	; 34
	.db #0x32	; 50	'2'
	.db #0x73	; 115	's'
	.db #0x54	; 84	'T'
	.db #0x77	; 119	'w'
	.db #0x2e	; 46
	.db #0x39	; 57	'9'
	.db #0x1f	; 31
	.db #0x14	; 20
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x44	; 68	'D'
	.db #0xc6	; 198
	.db #0x44	; 68	'D'
	.db #0x4c	; 76	'L'
	.db #0xce	; 206
	.db #0x2a	; 42
	.db #0xee	; 238
	.db #0x74	; 116	't'
	.db #0x9c	; 156
	.db #0xf8	; 248
	.db #0x28	; 40
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x42	; 66	'B'
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x1c	; 28
	.db #0x13	; 19
	.db #0x3b	; 59
	.db #0x26	; 38
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x67	; 103	'g'
	.db #0x58	; 88	'X'
	.db #0x5f	; 95
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xbe	; 190
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0xc2	; 194
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x63	; 99	'c'
	.db #0x5c	; 92
	.db #0x3d	; 61
	.db #0x2e	; 46
	.db #0x3d	; 61
	.db #0x22	; 34
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf6	; 246
	.db #0x0e	; 14
	.db #0xe0	; 224
	.db #0x18	; 24
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1d	; 29
	.db #0x12	; 18
	.db #0x3d	; 61
	.db #0x26	; 38
	.db #0x7b	; 123
	.db #0x4c	; 76	'L'
	.db #0x77	; 119	'w'
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0x38	; 56	'8'
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xbe	; 190
	.db #0x62	; 98	'b'
	.db #0xce	; 206
	.db #0x32	; 50	'2'
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0x7f	; 127
	.db #0x40	; 64
	.db #0x77	; 119	'w'
	.db #0x48	; 72	'H'
	.db #0x77	; 119	'w'
	.db #0x4c	; 76	'L'
	.db #0x3b	; 59
	.db #0x24	; 36
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0x8e	; 142
	.db #0x72	; 114	'r'
	.db #0x7c	; 124
	.db #0xe4	; 228
	.db #0x7c	; 124
	.db #0x84	; 132
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_bkg:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xdc	; 220
	.db #0xdc	; 220
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xdc	; 220
	.db #0xdc	; 220
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xac	; 172
	.db #0xac	; 172
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xec	; 236
	.db #0xec	; 236
	.db #0xbc	; 188
	.db #0xbc	; 188
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xc4	; 196
	.db #0xc4	; 196
	.db #0xc4	; 196
	.db #0xc4	; 196
	.db #0xd4	; 212
	.db #0xd4	; 212
	.db #0xc8	; 200
	.db #0xc8	; 200
	.db #0x74	; 116	't'
	.db #0x74	; 116	't'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xd0	; 208
	.db #0xd0	; 208
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x58	; 88	'X'
	.db #0x58	; 88	'X'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0xac	; 172
	.db #0xac	; 172
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xdc	; 220
	.db #0xdc	; 220
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x8c	; 140
	.db #0x58	; 88	'X'
	.db #0x58	; 88	'X'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x68	; 104	'h'
	.db #0x68	; 104	'h'
	.db #0xc4	; 196
	.db #0xc4	; 196
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0xf2	; 242
	.db #0xf6	; 246
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x4f	; 79	'O'
	.db #0x6f	; 111	'o'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0xf2	; 242
	.db #0xf6	; 246
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x4f	; 79	'O'
	.db #0x6f	; 111	'o'
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x47	; 71	'G'
	.db #0xb8	; 184
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0xfb	; 251
	.db #0x26	; 38
	.db #0xd9	; 217
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x1c	; 28
	.db #0xe3	; 227
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x5f	; 95
	.db #0xa0	; 160
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x40	; 64
	.db #0xbf	; 191
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0x18	; 24
	.db #0xe7	; 231
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x18	; 24
	.db #0xe7	; 231
	.db #0x3e	; 62
	.db #0xc1	; 193
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xcf	; 207
	.db #0x30	; 48	'0'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xf4	; 244
	.db #0x0b	; 11
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x13	; 19
	.db #0xec	; 236
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xe4	; 228
	.db #0x1b	; 27
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xd8	; 216
	.db #0x27	; 39
	.db #0x8c	; 140
	.db #0x73	; 115	's'
	.db #0x04	; 4
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x26	; 38
	.db #0xd9	; 217
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xfd	; 253
	.db #0x04	; 4
	.db #0xfb	; 251
	.db #0x84	; 132
	.db #0x7b	; 123
	.db #0xce	; 206
	.db #0x31	; 49	'1'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x0c	; 12
	.db #0xf3	; 243
	.db #0x05	; 5
	.db #0xfa	; 250
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0x9f	; 159
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xc8	; 200
	.db #0x37	; 55	'7'
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf2	; 242
	.db #0x0d	; 13
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0xfb	; 251
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xcf	; 207
	.db #0x30	; 48	'0'
	.db #0x8f	; 143
	.db #0x70	; 112	'p'
	.db #0xd3	; 211
	.db #0x2c	; 44
	.db #0xfd	; 253
	.db #0x02	; 2
	.db #0xfd	; 253
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0x0c	; 12
	.db #0xed	; 237
	.db #0x12	; 18
	.db #0x1e	; 30
	.db #0xe1	; 225
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0xe1	; 225
	.db #0xde	; 222
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x88	; 136
	.db #0x77	; 119	'w'
	.db #0xcc	; 204
	.db #0x33	; 51	'3'
	.db #0xe6	; 230
	.db #0x19	; 25
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x90	; 144
	.db #0x6f	; 111	'o'
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x42	; 66	'B'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x5a	; 90	'Z'
	.db #0x99	; 153
	.db #0x42	; 66	'B'
	.db #0xe7	; 231
	.db #0xbd	; 189
	.db #0x66	; 102	'f'
	.db #0x5a	; 90	'Z'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x46	; 70	'F'
	.db #0x7a	; 122	'z'
	.db #0x5e	; 94
	.db #0x62	; 98	'b'
	.db #0x6a	; 106	'j'
	.db #0x56	; 86	'V'
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
_menu_screen:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2d	; 45
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x0f	; 15
	.db #0x16	; 22
	.db #0x0f	; 15
	.db #0x0d	; 13
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x1a	; 26
	.db #0x16	; 22
	.db #0x0b	; 11
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x0b	; 11
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x1d	; 29
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x0b	; 11
	.db #0x1e	; 30
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2e	; 46
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2d	; 45
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x13	; 19
	.db #0x1e	; 30
	.db #0x16	; 22
	.db #0x0f	; 15
	.db #0x27	; 39
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x1c	; 28
	.db #0x0f	; 15
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2e	; 46
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_stats_screen:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2d	; 45
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x0b	; 11
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x0b	; 11
	.db #0x1e	; 30
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x0d	; 13
	.db #0x19	; 25
	.db #0x1c	; 28
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x1e	; 30
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x0b	; 11
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x0d	; 13
	.db #0x19	; 25
	.db #0x1c	; 28
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x1e	; 30
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x13	; 19
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x16	; 22
	.db #0x0b	; 11
	.db #0x23	; 35
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x16	; 22
	.db #0x0b	; 11
	.db #0x23	; 35
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2b	; 43
	.db #0x2e	; 46
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_game_screen:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x35	; 53	'5'
	.db #0x34	; 52	'4'
	.db #0x33	; 51	'3'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x3d	; 61
	.db #0x3c	; 60
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x39	; 57	'9'
	.db #0x38	; 56	'8'
	.db #0x37	; 55	'7'
	.db #0x36	; 54	'6'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x4a	; 74	'J'
	.db #0x4b	; 75	'K'
	.db #0x4c	; 76	'L'
	.db #0x4d	; 77	'M'
	.db #0x4e	; 78	'N'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3b	; 59
	.db #0x3a	; 58
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x49	; 73	'I'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x58	; 88	'X'
	.db #0x59	; 89	'Y'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x5f	; 95
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_hud:
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x1e	; 30
	.db #0x1d	; 29
	.db #0x27	; 39
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
;home_defender.c:139: void moveSprites(sprite* object, uint8_t x, uint8_t y){
;	---------------------------------
; Function moveSprites
; ---------------------------------
_moveSprites::
	add	sp, #-10
;home_defender.c:140: move_sprite(object->spriteIDs[0], object->x + x, object->y + y);
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0005
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#15
	add	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ld	hl, #0x0004
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
	add	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
	ld	a, (bc)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;home_defender.c:141: if(object->width == 16){
	ld	hl, #0x0006
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x10
	jr	NZ, 00102$
;home_defender.c:142: move_sprite(object->spriteIDs[1], object->x + 8 + x, object->y + y);
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#15
	add	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,	#14
	ld	e, (hl)
	add	a, e
	ldhl	sp,	#9
	ld	(hl), a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;home_defender.c:142: move_sprite(object->spriteIDs[1], object->x + 8 + x, object->y + y);
00102$:
;home_defender.c:144: if(object->height == 16){
	ld	hl, #0x0007
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x10
	jr	NZ, 00104$
;home_defender.c:145: move_sprite(object->spriteIDs[2], object->x + x, object->y + 8 + y);
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,	#15
	ld	e, (hl)
	add	a, e
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
	add	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;home_defender.c:145: move_sprite(object->spriteIDs[2], object->x + x, object->y + 8 + y);
00104$:
;home_defender.c:147: if(object->width == 16 && object->height == 16){
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x10
	jr	NZ, 00106$
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x10
	jr	NZ, 00106$
;home_defender.c:148: move_sprite(object->spriteIDs[3], object->x + 8 + x, object->y + 8 + y);
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,	#15
	ld	e, (hl)
	add	a, e
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,	#14
	ld	e, (hl)
	add	a, e
	ld	e, a
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ld	a, e
	ld	(bc), a
;home_defender.c:148: move_sprite(object->spriteIDs[3], object->x + 8 + x, object->y + 8 + y);
00106$:
;home_defender.c:150: object->x += x;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#14
	add	a, (hl)
	ld	c, a
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;home_defender.c:151: object->y += y;
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#15
	add	a, (hl)
	ld	c, a
	pop	hl
	push	hl
	ld	(hl), c
;home_defender.c:152: }
	add	sp, #10
	ret
;home_defender.c:155: void resetSprites(){
;	---------------------------------
; Function resetSprites
; ---------------------------------
_resetSprites::
;home_defender.c:157: maverick.x = 0;
	ld	hl, #(_maverick + 4)
	ld	(hl), #0x00
;home_defender.c:158: maverick.y = 0;
	ld	hl, #(_maverick + 5)
	ld	(hl), #0x00
;home_defender.c:159: moveSprites(&maverick, 0, 0);
	xor	a, a
	rrca
	push	af
	ld	de, #_maverick
	push	de
	call	_moveSprites
	add	sp, #4
;home_defender.c:162: shot1.x = 0;
	ld	hl, #(_shot1 + 4)
	ld	(hl), #0x00
;home_defender.c:163: shot1.y = 0;
	ld	hl, #(_shot1 + 5)
	ld	(hl), #0x00
;home_defender.c:164: moveSprites(&shot1, 0, 0);
	xor	a, a
	rrca
	push	af
	ld	de, #_shot1
	push	de
	call	_moveSprites
	add	sp, #4
;home_defender.c:167: shot2.x = 0;
	ld	hl, #(_shot2 + 4)
	ld	(hl), #0x00
;home_defender.c:168: shot2.y = 0;
	ld	hl, #(_shot2 + 5)
	ld	(hl), #0x00
;home_defender.c:169: moveSprites(&shot2, 0, 0);
	xor	a, a
	rrca
	push	af
	ld	de, #_shot2
	push	de
	call	_moveSprites
	add	sp, #4
;home_defender.c:172: missile.x = 0;
	ld	hl, #(_missile + 4)
	ld	(hl), #0x00
;home_defender.c:173: missile.y = 0;
	ld	hl, #(_missile + 5)
	ld	(hl), #0x00
;home_defender.c:174: moveSprites(&missile, 0, 0);
	xor	a, a
	rrca
	push	af
	ld	de, #_missile
	push	de
	call	_moveSprites
	add	sp, #4
;home_defender.c:177: asteroid1.x = 0;
	ld	hl, #(_asteroid1 + 4)
	ld	(hl), #0x00
;home_defender.c:178: asteroid1.y = 0;
	ld	hl, #(_asteroid1 + 5)
	ld	(hl), #0x00
;home_defender.c:179: moveSprites(&asteroid1, 0, 0);
	xor	a, a
	rrca
	push	af
	ld	de, #_asteroid1
	push	de
	call	_moveSprites
	add	sp, #4
;home_defender.c:182: asteroid2.x = 0;
	ld	hl, #(_asteroid2 + 4)
	ld	(hl), #0x00
;home_defender.c:183: asteroid2.y = 0;
	ld	hl, #(_asteroid2 + 5)
	ld	(hl), #0x00
;home_defender.c:184: moveSprites(&asteroid2, 0, 0);
	xor	a, a
	rrca
	push	af
	ld	de, #_asteroid2
	push	de
	call	_moveSprites
	add	sp, #4
;home_defender.c:186: }
	ret
;home_defender.c:189: void performanceDelay(uint8_t num){
;	---------------------------------
; Function performanceDelay
; ---------------------------------
_performanceDelay::
;home_defender.c:191: for(i = 0; i < num; i++){
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;home_defender.c:192: wait_vbl_done();
	call	_wait_vbl_done
;home_defender.c:191: for(i = 0; i < num; i++){
	inc	c
;home_defender.c:194: }
	jr	00103$
;home_defender.c:197: void fadeOut(){
;	---------------------------------
; Function fadeOut
; ---------------------------------
_fadeOut::
;home_defender.c:199: for(i = 0; i < 4; i++){
	ld	c, #0x00
00107$:
;home_defender.c:200: switch(i){
	ld	a, c
	or	a, a
	jr	Z, 00101$
	ld	a, c
	dec	a
	jr	Z, 00102$
	ld	a,c
	cp	a,#0x02
	jr	Z, 00103$
	sub	a, #0x03
	jr	Z, 00104$
	jr	00105$
;home_defender.c:201: case 0:
00101$:
;home_defender.c:202: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;home_defender.c:203: break;
	jr	00105$
;home_defender.c:204: case 1:
00102$:
;home_defender.c:205: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG + 0), a
;home_defender.c:206: break;
	jr	00105$
;home_defender.c:207: case 2:
00103$:
;home_defender.c:208: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG + 0), a
;home_defender.c:209: break;
	jr	00105$
;home_defender.c:210: case 3:
00104$:
;home_defender.c:211: BGP_REG = 0xFF;
	ld	a, #0xff
	ldh	(_BGP_REG + 0), a
;home_defender.c:213: }
00105$:
;home_defender.c:214: performanceDelay(3);
	push	bc
	ld	a, #0x03
	push	af
	inc	sp
	call	_performanceDelay
	inc	sp
	pop	bc
;home_defender.c:199: for(i = 0; i < 4; i++){
	inc	c
	ld	a, c
	sub	a, #0x04
	jr	C, 00107$
;home_defender.c:216: }
	ret
;home_defender.c:219: void fadeIn(){
;	---------------------------------
; Function fadeIn
; ---------------------------------
_fadeIn::
;home_defender.c:221: for(i = 0; i < 3; i++){
	ld	c, #0x00
00106$:
;home_defender.c:222: switch(i){
	ld	a, c
	or	a, a
	jr	Z, 00101$
	ld	a, c
	dec	a
	jr	Z, 00102$
	ld	a, c
	sub	a, #0x02
	jr	Z, 00103$
	jr	00104$
;home_defender.c:223: case 0:
00101$:
;home_defender.c:224: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG + 0), a
;home_defender.c:225: break;
	jr	00104$
;home_defender.c:226: case 1:
00102$:
;home_defender.c:227: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG + 0), a
;home_defender.c:228: break;
	jr	00104$
;home_defender.c:229: case 2:
00103$:
;home_defender.c:230: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;home_defender.c:232: }
00104$:
;home_defender.c:233: performanceDelay(3);
	push	bc
	ld	a, #0x03
	push	af
	inc	sp
	call	_performanceDelay
	inc	sp
	pop	bc
;home_defender.c:221: for(i = 0; i < 3; i++){
	inc	c
	ld	a, c
	sub	a, #0x03
	jr	C, 00106$
;home_defender.c:235: }
	ret
;home_defender.c:238: void fadeTransition(uint8_t num, char* data, char* tiles){
;	---------------------------------
; Function fadeTransition
; ---------------------------------
_fadeTransition::
;home_defender.c:239: fadeOut();
	call	_fadeOut
;home_defender.c:240: set_bkg_data(0, num, data);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	push	de
	ld	h, (hl)
	ld	l, #0x00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;home_defender.c:241: set_bkg_tiles(0, 0, 20, 18, tiles);
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	xor	a, a
	call	_set_bkg_tiles
	add	sp, #6
;home_defender.c:242: fadeIn();
;home_defender.c:243: }
	jp	_fadeIn
;home_defender.c:246: void playSounds(uint8_t soundVal){
;	---------------------------------
; Function playSounds
; ---------------------------------
_playSounds::
;home_defender.c:247: if(soundVal == 0){
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;home_defender.c:249: NR10_REG = 0x25;
	ld	a, #0x25
	ldh	(_NR10_REG + 0), a
;home_defender.c:250: NR11_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR11_REG + 0), a
;home_defender.c:251: NR12_REG = 0x36;
	ld	a, #0x36
	ldh	(_NR12_REG + 0), a
;home_defender.c:252: NR13_REG = 0x72;
	ld	a, #0x72
	ldh	(_NR13_REG + 0), a
;home_defender.c:253: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
00102$:
;home_defender.c:255: if(soundVal == 1){
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	NZ, 00104$
;home_defender.c:257: NR10_REG = 0x15;
	ld	a, #0x15
	ldh	(_NR10_REG + 0), a
;home_defender.c:258: NR11_REG = 0xC0;
	ld	a, #0xc0
	ldh	(_NR11_REG + 0), a
;home_defender.c:259: NR12_REG = 0x24;
	ld	a, #0x24
	ldh	(_NR12_REG + 0), a
;home_defender.c:260: NR13_REG = 0x73;
	ld	a, #0x73
	ldh	(_NR13_REG + 0), a
;home_defender.c:261: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
00104$:
;home_defender.c:263: if(soundVal == 2){
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00106$
;home_defender.c:265: NR10_REG = 0x2D;
	ld	a, #0x2d
	ldh	(_NR10_REG + 0), a
;home_defender.c:266: NR11_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR11_REG + 0), a
;home_defender.c:267: NR12_REG = 0x36;
	ld	a, #0x36
	ldh	(_NR12_REG + 0), a
;home_defender.c:268: NR13_REG = 0x72;
	ld	a, #0x72
	ldh	(_NR13_REG + 0), a
;home_defender.c:269: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
00106$:
;home_defender.c:271: if(soundVal == 3){
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00108$
;home_defender.c:273: NR10_REG = 0x4D;
	ld	a, #0x4d
	ldh	(_NR10_REG + 0), a
;home_defender.c:274: NR11_REG = 0xCF;
	ld	a, #0xcf
	ldh	(_NR11_REG + 0), a
;home_defender.c:275: NR12_REG = 0x64;
	ld	a, #0x64
	ldh	(_NR12_REG + 0), a
;home_defender.c:276: NR13_REG = 0xFA;
	ld	a, #0xfa
	ldh	(_NR13_REG + 0), a
;home_defender.c:277: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
00108$:
;home_defender.c:279: if(soundVal == 4){
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00110$
;home_defender.c:281: NR41_REG = 0x03;
	ld	a, #0x03
	ldh	(_NR41_REG + 0), a
;home_defender.c:282: NR42_REG = 0xE7;
	ld	a, #0xe7
	ldh	(_NR42_REG + 0), a
;home_defender.c:283: NR43_REG = 0xA8;
	ld	a, #0xa8
	ldh	(_NR43_REG + 0), a
;home_defender.c:284: NR44_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
00110$:
;home_defender.c:286: if(soundVal == 5){
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x05
	jr	NZ, 00112$
;home_defender.c:288: NR21_REG = 0xCA;
	ld	a, #0xca
	ldh	(_NR21_REG + 0), a
;home_defender.c:289: NR22_REG = 0x83;
	ld	a, #0x83
	ldh	(_NR22_REG + 0), a
;home_defender.c:290: NR23_REG = 0xD7;
	ld	a, #0xd7
	ldh	(_NR23_REG + 0), a
;home_defender.c:291: NR24_REG = 0xC6;
	ld	a, #0xc6
	ldh	(_NR24_REG + 0), a
00112$:
;home_defender.c:293: if(soundVal == 6){
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00114$
;home_defender.c:295: NR41_REG = 0x3A;
	ld	a, #0x3a
	ldh	(_NR41_REG + 0), a
;home_defender.c:296: NR42_REG = 0xA1;
	ld	a, #0xa1
	ldh	(_NR42_REG + 0), a
;home_defender.c:297: NR43_REG = 0x00;
	xor	a, a
	ldh	(_NR43_REG + 0), a
;home_defender.c:298: NR44_REG = 0xC0;
	ld	a, #0xc0
	ldh	(_NR44_REG + 0), a
00114$:
;home_defender.c:300: if(soundVal == 7){
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x07
	jr	NZ, 00116$
;home_defender.c:302: NR10_REG = 0x15;
	ld	a, #0x15
	ldh	(_NR10_REG + 0), a
;home_defender.c:303: NR11_REG = 0xC0;
	ld	a, #0xc0
	ldh	(_NR11_REG + 0), a
;home_defender.c:304: NR12_REG = 0x24;
	ld	a, #0x24
	ldh	(_NR12_REG + 0), a
;home_defender.c:305: NR13_REG = 0x73;
	ld	a, #0x73
	ldh	(_NR13_REG + 0), a
;home_defender.c:306: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG + 0), a
00116$:
;home_defender.c:309: if(soundVal == 8){
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x08
	jr	NZ, 00118$
;home_defender.c:311: NR41_REG = 0x00;
	xor	a, a
	ldh	(_NR41_REG + 0), a
;home_defender.c:312: NR42_REG = 0xD6;
	ld	a, #0xd6
	ldh	(_NR42_REG + 0), a
;home_defender.c:313: NR43_REG = 0x37;
	ld	a, #0x37
	ldh	(_NR43_REG + 0), a
;home_defender.c:314: NR44_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR44_REG + 0), a
00118$:
;home_defender.c:316: if(soundVal == 9){
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x09
	ret	NZ
;home_defender.c:319: NR21_REG = 0xCA;
	ld	a, #0xca
	ldh	(_NR21_REG + 0), a
;home_defender.c:320: NR22_REG = 0x83;
	ld	a, #0x83
	ldh	(_NR22_REG + 0), a
;home_defender.c:321: NR23_REG = 0xD7;
	ld	a, #0xd7
	ldh	(_NR23_REG + 0), a
;home_defender.c:322: NR24_REG = 0xC6;
	ld	a, #0xc6
	ldh	(_NR24_REG + 0), a
;home_defender.c:324: }
	ret
;home_defender.c:327: void printScore(UBYTE isInGame, UBYTE isHighScore){
;	---------------------------------
; Function printScore
; ---------------------------------
_printScore::
	add	sp, #-11
;home_defender.c:332: if(isInGame == 1 || isHighScore != 1){
	ldhl	sp,	#13
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00127$
	xor	a, a
00127$:
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,	#14
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00129$
	xor	a, a
00129$:
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00105$
	inc	hl
	bit	0, (hl)
	jp	NZ, 00106$
00105$:
;home_defender.c:333: scoreKeeper = currScore;
	ld	hl, #_currScore
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;home_defender.c:334: currScoreKeeper[0] = 1 + (scoreKeeper/10000);
	ldhl	sp,	#0
	ld	a, l
	ld	d, h
	ldhl	sp,	#7
	ld	(hl+), a
	ld	(hl), d
	push	bc
	ld	de, #0x2710
	push	de
	push	bc
	call	__divuint
	add	sp, #4
	ldhl	sp,	#11
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	pop	bc
	ldhl	sp,	#9
	ld	a, (hl-)
	dec	hl
	inc	a
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;home_defender.c:335: remainder = scoreKeeper - ((scoreKeeper/10000)*10000);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
;home_defender.c:337: currScoreKeeper[1] = 1 + (scoreKeeper/1000);
	ldhl	sp,	#7
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	de
	ld	b, a
	push	bc
	push	de
	ld	hl, #0x03e8
	push	hl
	push	bc
	call	__divuint
	add	sp, #4
	ldhl	sp,	#13
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	pop	de
	pop	bc
	ldhl	sp,	#9
	ld	a, (hl)
;home_defender.c:338: remainder = scoreKeeper - ((scoreKeeper/1000)*1000);
	inc	a
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
;home_defender.c:340: currScoreKeeper[2] = 1 + (scoreKeeper/100);
	ldhl	sp,	#7
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	de
	inc	de
	ld	b, a
	push	bc
	push	de
	ld	hl, #0x0064
	push	hl
	push	bc
	call	__divuint
	add	sp, #4
	ldhl	sp,	#13
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	pop	de
	pop	bc
	ldhl	sp,	#9
	ld	a, (hl)
;home_defender.c:341: remainder = scoreKeeper - ((scoreKeeper/100)*100);
	inc	a
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	a, c
	sub	a, l
	ld	e, a
	ld	a, b
	sbc	a, h
	ld	d, a
;home_defender.c:343: currScoreKeeper[3] = 1 + (scoreKeeper/10);
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	push	bc
	ld	hl, #0x000a
	push	hl
	push	de
	call	__divuint
	add	sp, #4
	pop	bc
	ld	a, e
	inc	a
	ld	(bc), a
;home_defender.c:345: currScoreKeeper[4] = 1 + (currScore %10);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_currScore
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	bc
	ld	hl, #0x000a
	push	hl
	push	de
	call	__moduint
	add	sp, #4
	pop	bc
	ld	a, e
	inc	a
	ld	(bc), a
;home_defender.c:347: if(isInGame == 1){
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;home_defender.c:348: set_win_tiles(15, 0, 5, 1, currScoreKeeper);
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #0x105
	push	hl
	ld	hl, #0x0f
	push	hl
	call	_set_win_tiles
	add	sp, #6
00102$:
;home_defender.c:350: if(isHighScore != 1){
	ldhl	sp,	#6
	bit	0, (hl)
	jp	NZ, 00109$
;home_defender.c:351: set_bkg_tiles(6, 10, 5, 1, currScoreKeeper);
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #0x105
	push	hl
	ld	hl, #0xa06
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
	jp	00109$
00106$:
;home_defender.c:355: scoreKeeper = hiScore;
	ld	hl, #_hiScore
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;home_defender.c:356: currScoreKeeper[0] = 1 + (scoreKeeper/10000);
	ldhl	sp,	#0
	ld	a, l
	ld	d, h
	ldhl	sp,	#7
	ld	(hl+), a
	ld	(hl), d
;home_defender.c:334: currScoreKeeper[0] = 1 + (scoreKeeper/10000);
	push	bc
	ld	de, #0x2710
	push	de
	push	bc
;home_defender.c:356: currScoreKeeper[0] = 1 + (scoreKeeper/10000);
	call	__divuint
	add	sp, #4
	ldhl	sp,	#11
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	pop	bc
	ldhl	sp,	#9
	ld	a, (hl-)
	dec	hl
	inc	a
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;home_defender.c:357: remainder = scoreKeeper - ((scoreKeeper/10000)*10000);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
;home_defender.c:359: currScoreKeeper[1] = 1 + (scoreKeeper/1000);
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	push	bc
	push	de
	ld	hl, #0x03e8
	push	hl
	push	bc
	call	__divuint
	add	sp, #4
	ldhl	sp,	#13
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	pop	de
	pop	bc
	ldhl	sp,	#9
	ld	a, (hl)
;home_defender.c:360: remainder = scoreKeeper - ((scoreKeeper/1000)*1000);
	inc	a
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
;home_defender.c:362: currScoreKeeper[2] = 1 + (scoreKeeper/100);
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	push	bc
	push	de
	ld	hl, #0x0064
	push	hl
	push	bc
	call	__divuint
	add	sp, #4
	ldhl	sp,	#13
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	pop	de
	pop	bc
	ldhl	sp,	#9
	ld	a, (hl)
;home_defender.c:363: remainder = scoreKeeper - ((scoreKeeper/100)*100);
	inc	a
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
;home_defender.c:365: currScoreKeeper[3] = 1 + (scoreKeeper/10);
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	push	hl
	ld	de, #0x000a
	push	de
	push	bc
	call	__divuint
	add	sp, #4
	pop	hl
	inc	e
	ld	(hl), e
;home_defender.c:367: currScoreKeeper[4] = 1 + (hiScore %10);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #_hiScore
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	bc
	ld	hl, #0x000a
	push	hl
	push	de
	call	__moduint
	add	sp, #4
	pop	bc
	ld	a, e
	inc	a
	ld	(bc), a
;home_defender.c:368: set_bkg_tiles(6, 6, 5, 1, currScoreKeeper);
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #0x105
	push	hl
	ld	hl, #0x606
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
00109$:
;home_defender.c:370: }
	add	sp, #11
	ret
;home_defender.c:373: void updateWin(UBYTE destroyed){
;	---------------------------------
; Function updateWin
; ---------------------------------
_updateWin::
	add	sp, #-8
;home_defender.c:379: if(destroyed == 1){
	ldhl	sp,	#10
	ld	a, (hl)
	dec	a
	jr	NZ, 00102$
;home_defender.c:380: life--;
	ld	hl, #_life
	dec	(hl)
00102$:
;home_defender.c:382: if(life < 100){
	ld	a, (#_life)
	sub	a, #0x64
	jr	NC, 00104$
;home_defender.c:383: playerLives[0] = 1 + life;
	ldhl	sp,	#3
	ld	c, l
	ld	b, h
	ld	a, (#_life)
	inc	a
	ld	(bc), a
;home_defender.c:384: set_win_tiles(3, 0, 1, 1, playerLives);
	push	bc
	ld	hl, #0x101
	push	hl
	ld	hl, #0x03
	push	hl
	call	_set_win_tiles
	add	sp, #6
00104$:
;home_defender.c:387: if(earthHealth < 100){
	ld	a, (#_earthHealth)
	sub	a, #0x64
	jp	NC, 00111$
;home_defender.c:388: health[0] = 1;
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	(hl), #0x01
;home_defender.c:389: for(loop = 0; loop <= earthHealth + 5; loop += 10){
	xor	a, a
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), a
00112$:
;home_defender.c:390: if(earthHealth % loop < 10){
	ld	hl, #_earthHealth
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	de
	call	__moduint
	add	sp, #4
	pop	bc
;home_defender.c:391: health[1] = 1 + (loop/10);
	ldhl	sp,	#4
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
;home_defender.c:390: if(earthHealth % loop < 10){
	ld	a, e
	sub	a, #0x0a
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00113$
;home_defender.c:391: health[1] = 1 + (loop/10);
	ld	e, c
	ld	d, b
	inc	de
	push	bc
	push	de
	ld	hl, #0x000a
	push	hl
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	call	__divuint
	add	sp, #4
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	pop	de
	pop	bc
	ld	a, l
	inc	a
	ld	(de), a
;home_defender.c:392: if(earthHealth == 5){
	ld	a, (#_earthHealth)
	sub	a, #0x05
	jr	NZ, 00106$
;home_defender.c:393: health[1] = 1;
	ld	a, #0x01
	ld	(de), a
00106$:
;home_defender.c:395: remainder = earthHealth % loop;
	ld	hl, #_earthHealth
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	de
	call	__moduint
	add	sp, #4
	pop	bc
;home_defender.c:396: health[2] = 1 + remainder;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	e
	ld	(hl), e
00113$:
;home_defender.c:389: for(loop = 0; loop <= earthHealth + 5; loop += 10){
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	e, l
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), e
	inc	hl
	ld	(hl), a
	ld	hl, #_earthHealth
	ld	e, (hl)
	ld	d, #0x00
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	ldhl	sp,	#4
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jp	NC, 00112$
;home_defender.c:399: set_win_tiles(6, 0, 3, 1, health);
	push	bc
	ld	hl, #0x103
	push	hl
	ld	hl, #0x06
	push	hl
	call	_set_win_tiles
	add	sp, #6
00111$:
;home_defender.c:401: printScore(1, 1);
	ld	hl, #0x101
	push	hl
	call	_printScore
	pop	hl
;home_defender.c:402: }
	add	sp, #8
	ret
;home_defender.c:405: void checkCollisions(sprite *obj1, sprite *obj2, uint8_t *cooldown){
;	---------------------------------
; Function checkCollisions
; ---------------------------------
_checkCollisions::
	add	sp, #-27
;home_defender.c:406: if(obj1->x != 0 && obj1->y != 0){
	ldhl	sp,	#29
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#30
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	or	a, a
	jp	Z, 00122$
	pop	de
	push	de
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	or	a, a
	jp	Z, 00122$
;home_defender.c:407: if(((obj1->x >= obj2->x && obj1->x <= obj2->x+obj2->width) && (obj1->y >= obj2->y && obj1->y <= obj2->y+obj2->height)) ||
	ldhl	sp,	#31
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#32
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#17
	ld	(hl+), a
	ld	(hl), #0x00
;home_defender.c:408: ((obj2->x >= obj1->x && obj2->x <= obj1->x+obj1->width) && (obj2->y >= obj1->y && obj2->y <= obj1->y+obj1->height))){
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#23
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#22
	ld	(hl), a
;home_defender.c:407: if(((obj1->x >= obj2->x && obj1->x <= obj2->x+obj2->width) && (obj1->y >= obj2->y && obj1->y <= obj2->y+obj2->height)) ||
	ld	a, c
	sub	a, b
	jp	C, 00118$
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#27
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#26
	ld	(hl), a
	ldhl	sp,	#25
	ld	e, l
	ld	d, h
	ldhl	sp,	#13
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00189$
	bit	7, d
	jr	NZ, 00190$
	cp	a, a
	jr	00190$
00189$:
	bit	7, d
	jr	Z, 00190$
	scf
00190$:
	jr	C, 00118$
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#26
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#26
	sub	a, (hl)
	jr	C, 00118$
	ld	a, (hl)
	ldhl	sp,	#23
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#23
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#27
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#26
	ld	(hl), a
	ldhl	sp,	#25
	ld	e, l
	ld	d, h
	ldhl	sp,	#17
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00191$
	bit	7, d
	jr	NZ, 00192$
	cp	a, a
	jr	00192$
00191$:
	bit	7, d
	jr	Z, 00192$
	scf
00192$:
	jr	NC, 00110$
00118$:
;home_defender.c:408: ((obj2->x >= obj1->x && obj2->x <= obj1->x+obj1->width) && (obj2->y >= obj1->y && obj2->y <= obj1->y+obj1->height))){
	ld	a, b
	sub	a, c
	jp	C, 00122$
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#11
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00193$
	bit	7, d
	jr	NZ, 00194$
	cp	a, a
	jr	00194$
00193$:
	bit	7, d
	jr	Z, 00194$
	scf
00194$:
	jp	C, 00122$
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#6
	sub	a, (hl)
	jp	C, 00122$
	ldhl	sp,#21
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	d, #0x00
	ld	e, a
	ldhl	sp,	#17
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#27
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#26
	ld	(hl-), a
	ld	b, #0x00
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00195$
	bit	7, d
	jr	NZ, 00196$
	cp	a, a
	jr	00196$
00195$:
	bit	7, d
	jr	Z, 00196$
	scf
00196$:
	jp	C, 00122$
00110$:
;home_defender.c:409: if(obj1->width < 16){
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;home_defender.c:410: obj2->hp = 0;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#25
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#24
	ld	(hl), a
;home_defender.c:409: if(obj1->width < 16){
	ld	a, c
	sub	a, #0x10
	jr	NC, 00102$
;home_defender.c:410: obj2->hp = 0;
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), #0x00
;home_defender.c:411: currScore += 20;
	ld	a, (#_currScore)
	ldhl	sp,	#25
	ld	(hl), a
	ld	a, (#_currScore + 1)
	ldhl	sp,	#26
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0014
	add	hl, de
	ld	c, l
	ld	a, h
	ld	hl, #_currScore
	ld	(hl), c
	inc	hl
	ld	(hl), a
;home_defender.c:412: obj1->x = 0;
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;home_defender.c:413: obj1->y = 0;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;home_defender.c:414: moveSprites(obj1, 0, 0);
	xor	a, a
	rrca
	push	af
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_moveSprites
	add	sp, #4
;home_defender.c:415: updateWin(0);
	xor	a, a
	push	af
	inc	sp
	call	_updateWin
	inc	sp
00102$:
;home_defender.c:417: if(obj1-> height < 16){
	ldhl	sp,#21
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x10
	jr	NC, 00104$
;home_defender.c:418: currScore += 5;
	ld	hl, #_currScore
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;home_defender.c:419: obj2->hp = obj2->hp - obj1->hp;
	ldhl	sp,#23
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	c, a
	ldhl	sp,	#23
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;home_defender.c:420: obj1->x = 0;
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;home_defender.c:421: obj1->y = 0;
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;home_defender.c:422: moveSprites(obj1, 0, 0);
	xor	a, a
	rrca
	push	af
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_moveSprites
	add	sp, #4
;home_defender.c:423: updateWin(0);
	xor	a, a
	push	af
	inc	sp
	call	_updateWin
	inc	sp
00104$:
;home_defender.c:425: if(obj1->height == 16 && obj1->width == 16){
	ldhl	sp,#21
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x10
	jr	NZ, 00106$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x10
	jr	NZ, 00106$
;home_defender.c:426: currScore += 5;
	ld	hl, #_currScore
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;home_defender.c:427: obj2->hp = 0;
	ldhl	sp,	#23
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;home_defender.c:428: obj1->x = 80;
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x50
;home_defender.c:429: lostLife = 1;
	ld	hl, #_lostLife
	ld	(hl), #0x01
;home_defender.c:430: playSounds(9);
	ld	a, #0x09
	push	af
	inc	sp
	call	_playSounds
	inc	sp
;home_defender.c:431: moveSprites(obj1, 0, 0);
	xor	a, a
	rrca
	push	af
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_moveSprites
	add	sp, #4
;home_defender.c:432: updateWin(0);
	xor	a, a
	push	af
	inc	sp
	call	_updateWin
	inc	sp
00106$:
;home_defender.c:435: if(obj2->hp == 0){
	ldhl	sp,#23
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	NZ, 00122$
;home_defender.c:436: playSounds(7);
	ld	a, #0x07
	push	af
	inc	sp
	call	_playSounds
	inc	sp
;home_defender.c:437: *cooldown = 0;
	ldhl	sp,	#33
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	ld	(bc), a
;home_defender.c:438: obj2->x = 0;
	ldhl	sp,	#9
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;home_defender.c:439: obj2->y = 0;
	ldhl	sp,	#15
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;home_defender.c:440: obj2->hp = 3;
	ldhl	sp,	#23
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x03
;home_defender.c:441: moveSprites(obj2, 0, 0);
	xor	a, a
	rrca
	push	af
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_moveSprites
	add	sp, #4
00122$:
;home_defender.c:445: }
	add	sp, #27
	ret
;home_defender.c:447: void earthquake(UBYTE fin, UBYTE *earthHit){
;	---------------------------------
; Function earthquake
; ---------------------------------
_earthquake::
;home_defender.c:448: if(fin == 0){
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	NZ, 00164$
;home_defender.c:449: if(quakeIter == 0){
	ld	a, (#_quakeIter)
	or	a, a
	jr	NZ, 00102$
;home_defender.c:450: playSounds(8);
	ld	a, #0x08
	push	af
	inc	sp
	call	_playSounds
	inc	sp
00102$:
;home_defender.c:452: if(quakeIter == 0 || quakeIter == 12){
	ld	hl, #_quakeIter
	ld	a, (hl)
	or	a, a
	jr	Z, 00103$
	ld	a, (hl)
	sub	a, #0x0c
	jr	NZ, 00104$
00103$:
;c:/gbdk/include/gb/gb.h:1094: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	add	a, #0x08
	ldh	(_SCX_REG + 0), a
;home_defender.c:453: scroll_bkg(8,0);
00104$:
;home_defender.c:455: if(quakeIter == 3 || quakeIter == 15){
	ld	a, (#_quakeIter)
	sub	a, #0x03
	jr	Z, 00106$
	ld	a, (#_quakeIter)
	sub	a, #0x0f
	jr	NZ, 00107$
00106$:
;c:/gbdk/include/gb/gb.h:1094: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	add	a, #0xf0
	ldh	(_SCX_REG + 0), a
;home_defender.c:456: scroll_bkg(-16,0);
00107$:
;home_defender.c:458: if(quakeIter == 6 || quakeIter == 18){
	ld	a, (#_quakeIter)
	sub	a, #0x06
	jr	Z, 00109$
	ld	a, (#_quakeIter)
	sub	a, #0x12
	jr	NZ, 00110$
00109$:
;c:/gbdk/include/gb/gb.h:1094: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	add	a, #0x10
	ldh	(_SCX_REG + 0), a
;home_defender.c:459: scroll_bkg(16,0);
00110$:
;home_defender.c:461: if(quakeIter == 9 || quakeIter == 21){
	ld	a, (#_quakeIter)
	sub	a, #0x09
	jr	Z, 00112$
	ld	a, (#_quakeIter)
	sub	a, #0x15
	jr	NZ, 00113$
00112$:
;c:/gbdk/include/gb/gb.h:1094: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	add	a, #0xf8
	ldh	(_SCX_REG + 0), a
;home_defender.c:462: scroll_bkg(-8,0);
00113$:
;home_defender.c:464: quakeIter++;
	ld	hl, #_quakeIter
	inc	(hl)
;home_defender.c:465: if(quakeIter >= 21){
	ld	a, (hl)
	sub	a, #0x15
	ret	C
;c:/gbdk/include/gb/gb.h:1094: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	add	a, #0xf8
	ldh	(_SCX_REG + 0), a
;home_defender.c:467: quakeIter = 0;
	ld	(hl), #0x00
;home_defender.c:468: *earthHit = 0;
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	ld	(bc), a
	ret
;home_defender.c:473: for(quake = 0; quake < 22; quake++){
00164$:
	ld	c, #0x00
00147$:
;home_defender.c:474: quakeIter = quake;
	ld	hl, #_quakeIter
	ld	(hl), c
;home_defender.c:476: if(quakeIter == 0){
	ld	a, (hl)
	or	a, a
	jr	NZ, 00118$
;home_defender.c:477: playSounds(8);
	push	bc
	ld	a, #0x08
	push	af
	inc	sp
	call	_playSounds
	inc	sp
	pop	bc
00118$:
;home_defender.c:479: if(quakeIter == 0 || quakeIter == 12){
	ld	hl, #_quakeIter
	ld	a, (hl)
	or	a, a
	jr	Z, 00119$
	ld	a, (hl)
	sub	a, #0x0c
	jr	NZ, 00120$
00119$:
;c:/gbdk/include/gb/gb.h:1094: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	add	a, #0x08
	ldh	(_SCX_REG + 0), a
;home_defender.c:480: scroll_bkg(8,0);
00120$:
;home_defender.c:482: if(quakeIter == 3 || quakeIter == 15){
	ld	a, (#_quakeIter)
	sub	a, #0x03
	jr	Z, 00122$
	ld	a, (#_quakeIter)
	sub	a, #0x0f
	jr	NZ, 00123$
00122$:
;c:/gbdk/include/gb/gb.h:1094: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	add	a, #0xf0
	ldh	(_SCX_REG + 0), a
;home_defender.c:483: scroll_bkg(-16,0);
00123$:
;home_defender.c:485: if(quakeIter == 6 || quakeIter == 18){
	ld	a, (#_quakeIter)
	sub	a, #0x06
	jr	Z, 00125$
	ld	a, (#_quakeIter)
	sub	a, #0x12
	jr	NZ, 00126$
00125$:
;c:/gbdk/include/gb/gb.h:1094: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	add	a, #0x10
	ldh	(_SCX_REG + 0), a
;home_defender.c:486: scroll_bkg(16,0);
00126$:
;home_defender.c:488: if(quakeIter == 9 || quakeIter == 21){
	ld	a, (#_quakeIter)
	sub	a, #0x09
	jr	Z, 00128$
	ld	a, (#_quakeIter)
	sub	a, #0x15
	jr	NZ, 00129$
00128$:
;c:/gbdk/include/gb/gb.h:1094: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	add	a, #0xf8
	ldh	(_SCX_REG + 0), a
;home_defender.c:489: scroll_bkg(-8,0);
00129$:
;home_defender.c:491: quakeIter++;
	ld	hl, #_quakeIter
	inc	(hl)
;home_defender.c:492: if(quakeIter >= 21){
	ld	a, (hl)
	sub	a, #0x15
	jr	C, 00132$
;c:/gbdk/include/gb/gb.h:1094: SCX_REG+=x, SCY_REG+=y;
;home_defender.c:494: quakeIter = 0;
	ld	(hl), #0x00
;home_defender.c:495: earthHit = 0;
00132$:
;home_defender.c:497: performanceDelay(2);
	push	bc
	ld	a, #0x02
	push	af
	inc	sp
	call	_performanceDelay
	inc	sp
	pop	bc
;home_defender.c:473: for(quake = 0; quake < 22; quake++){
	inc	c
	ld	a, c
	sub	a, #0x16
	jr	C, 00147$
;home_defender.c:500: }
	ret
;home_defender.c:503: void startScreen(){
;	---------------------------------
; Function startScreen
; ---------------------------------
_startScreen::
;home_defender.c:504: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;home_defender.c:506: waitpad(J_START);
	ld	a, #0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;home_defender.c:507: playSounds(0);
	xor	a, a
	push	af
	inc	sp
	call	_playSounds
	inc	sp
;home_defender.c:508: performanceDelay(4);
	ld	a, #0x04
	push	af
	inc	sp
	call	_performanceDelay
	inc	sp
;home_defender.c:509: }
	ret
;home_defender.c:512: void playGame(){
;	---------------------------------
; Function playGame
; ---------------------------------
_playGame::
	add	sp, #-12
;home_defender.c:513: earthHealth = 100;
	ld	hl, #_earthHealth
	ld	(hl), #0x64
;home_defender.c:514: currScore = 0;
	xor	a, a
	ld	hl, #_currScore
	ld	(hl+), a
	ld	(hl), a
;home_defender.c:515: UBYTE earthHit = 0;
	ldhl	sp,	#0
	ld	(hl), #0x00
;home_defender.c:516: lostLife = 0;
	ld	hl, #_lostLife
	ld	(hl), #0x00
;home_defender.c:517: uint8_t blastDelay = 10;
	ldhl	sp,	#8
;home_defender.c:518: uint16_t missileDelay = 900;
	ld	a, #0x0a
	ld	(hl+), a
	ld	a, #0x84
	ld	(hl+), a
	ld	(hl), #0x03
;home_defender.c:519: life = 3;
	ld	hl, #_life
	ld	(hl), #0x03
;home_defender.c:520: uint8_t a1Cooldown = 30;
	ldhl	sp,	#6
;home_defender.c:521: uint8_t a2Cooldown = 50;
	ld	a, #0x1e
	ld	(hl+), a
	ld	(hl), #0x32
;home_defender.c:526: fadeOut();
	call	_fadeOut
;home_defender.c:527: set_bkg_tiles(0, 0, 28, 18, game_screen);
	ld	de, #_game_screen
	push	de
	ld	hl, #0x121c
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;c:/gbdk/include/gb/gb.h:1080: SCX_REG=x, SCY_REG=y;
	ld	a, #0x20
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;home_defender.c:529: set_win_data(0, 97, bkg);
	ld	de, #_bkg
	push	de
	ld	hl, #0x6100
	push	hl
	call	_set_win_data
	add	sp, #4
;home_defender.c:530: set_win_tiles(0, 0, 20, 1, hud);
	ld	de, #_hud
	push	de
	ld	hl, #0x114
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;c:/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x08
	ldh	(_WX_REG + 0), a
	ld	a, #0x86
	ldh	(_WY_REG + 0), a
;home_defender.c:532: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;home_defender.c:533: setUpSprites();
	call	_setUpSprites
;home_defender.c:534: moveSprites(&maverick, 80, 100);
	ld	hl, #0x6450
	push	hl
	ld	de, #_maverick
	push	de
	call	_moveSprites
	add	sp, #4
;home_defender.c:535: fadeIn();
	call	_fadeIn
;home_defender.c:537: while(earthHealth > 0 && life < 4){
	ldhl	sp,	#11
	ld	(hl), #0x00
00205$:
	ld	a, (#_earthHealth)
	or	a, a
	jp	Z, 00207$
	ld	hl, #_life
	ld	a, (hl)
	sub	a, #0x04
	jp	NC, 00207$
;home_defender.c:538: if(joypad() & J_LEFT && maverick.x > 9){
	call	_joypad
	bit	1, e
	jr	Z, 00102$
	ld	hl, #(_maverick + 4)
	ld	c, (hl)
	ld	a, #0x09
	sub	a, c
	jr	NC, 00102$
;home_defender.c:539: moveSprites(&maverick, -(maverick.speed), 0);
	ld	hl, #(_maverick + 9)
	ld	c, (hl)
	xor	a, a
	sub	a, c
	ld	b, a
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	de, #_maverick
	push	de
	call	_moveSprites
	add	sp, #4
00102$:
;home_defender.c:541: if(joypad() & J_RIGHT && maverick.x < 151){
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00105$
	ld	a, (#(_maverick + 4) + 0)
	sub	a, #0x97
	jr	NC, 00105$
;home_defender.c:542: moveSprites(&maverick, maverick.speed, 0);
	ld	a, (#(_maverick + 9) + 0)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	de, #_maverick
	push	de
	call	_moveSprites
	add	sp, #4
00105$:
;home_defender.c:544: if(joypad() & J_A && blastDelay == 10){
	call	_joypad
	bit	4, e
	jr	Z, 00114$
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x0a
	jr	NZ, 00114$
;home_defender.c:545: playSounds(3);
	ld	a, #0x03
	push	af
	inc	sp
	call	_playSounds
	inc	sp
;home_defender.c:546: blastDelay = 0;
	ldhl	sp,	#8
	ld	(hl), #0x00
;home_defender.c:547: if((shot1.x == 0 && shot1.y == 0)||(shot1.x != 0 && shot2.y != 0)){
	ld	hl, #(_shot1 + 4)
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	NZ, 00112$
	ld	a, (#(_shot1 + 5) + 0)
	or	a, a
	jr	Z, 00107$
00112$:
	ld	a, c
	or	a, a
	jr	Z, 00108$
	ld	a, (#(_shot2 + 5) + 0)
	or	a, a
	jr	Z, 00108$
00107$:
;home_defender.c:548: moveSprites(&shot1, maverick.x, maverick.y);
	ld	hl, #(_maverick + 5)
	ld	b, (hl)
	ld	a, (#(_maverick + 4) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	de, #_shot1
	push	de
	call	_moveSprites
	add	sp, #4
	jr	00114$
00108$:
;home_defender.c:551: moveSprites(&shot2, maverick.x, maverick.y);
	ld	hl, #(_maverick + 5)
	ld	b, (hl)
	ld	a, (#(_maverick + 4) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	de, #_shot2
	push	de
	call	_moveSprites
	add	sp, #4
00114$:
;home_defender.c:554: if(joypad() & J_B){
	call	_joypad
	bit	5, e
	jr	Z, 00124$
;home_defender.c:555: if(missileDelay == 900){
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x84
	jr	NZ, 00121$
	ld	a, b
	sub	a, #0x03
	jr	NZ, 00121$
;home_defender.c:556: playSounds(4);
	ld	a, #0x04
	push	af
	inc	sp
	call	_playSounds
	inc	sp
;home_defender.c:557: missileDelay = 0;
	xor	a, a
	ldhl	sp,	#9
	ld	(hl+), a
	ld	(hl), a
;home_defender.c:558: moveSprites(&missile, maverick.x + 4, maverick.y);
	ld	hl, #(_maverick + 5)
	ld	b, (hl)
	ld	a, (#(_maverick + 4) + 0)
	add	a, #0x04
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	de, #_missile
	push	de
	call	_moveSprites
	add	sp, #4
	jr	00124$
00121$:
;home_defender.c:560: else if(missileDelay < 900 && missileDelay >= 50 && missileDelay % 3 == 0){
	ld	a, c
	sub	a, #0x84
	ld	a, b
	sbc	a, #0x03
	jr	NC, 00124$
	ld	a, c
	sub	a, #0x32
	ld	a, b
	sbc	a, #0x00
	jr	C, 00124$
	ld	de, #0x0003
	push	de
	push	bc
	call	__moduint
	add	sp, #4
	ld	a, d
	or	a, e
	jr	NZ, 00124$
;home_defender.c:561: playSounds(6);
	ld	a, #0x06
	push	af
	inc	sp
	call	_playSounds
	inc	sp
00124$:
;home_defender.c:564: if(joypad() & J_START){
	call	_joypad
	ld	a, e
	rlca
	jr	NC, 00126$
;home_defender.c:565: performanceDelay(10);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_performanceDelay
	inc	sp
;home_defender.c:566: waitpad(J_START);
	ld	a, #0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;home_defender.c:567: performanceDelay(10);
	ld	a, #0x0a
	push	af
	inc	sp
	call	_performanceDelay
	inc	sp
00126$:
;home_defender.c:569: if(joypad() & J_SELECT){
	call	_joypad
	bit	6, e
	jr	Z, 00128$
;home_defender.c:570: life = 4;
	ld	hl, #_life
	ld	(hl), #0x04
00128$:
;home_defender.c:573: if(shot1.x != 0 && shot1.y != 0){
	ld	a, (#(_shot1 + 4) + 0)
	or	a, a
	jr	Z, 00132$
	ld	bc, #_shot1 + 5
	ld	a, (bc)
	or	a, a
	jr	Z, 00132$
;home_defender.c:574: moveSprites(&shot1, 0, -(shot1.speed));
	ld	hl, #_shot1 + 9
	ld	e, (hl)
	xor	a, a
	sub	a, e
	ld	d, a
	push	bc
	push	de
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	de, #_shot1
	push	de
	call	_moveSprites
	add	sp, #4
	pop	bc
;home_defender.c:575: if(shot1.y == 0){
	ld	a, (bc)
	or	a, a
	jr	NZ, 00132$
;home_defender.c:576: shot1.x = 0;
	ld	hl, #(_shot1 + 4)
	ld	(hl), #0x00
;home_defender.c:577: shot1.y = 0;
	xor	a, a
	ld	(bc), a
;home_defender.c:578: moveSprites(&shot1, 0, 0);
	xor	a, a
	rrca
	push	af
	ld	de, #_shot1
	push	de
	call	_moveSprites
	add	sp, #4
00132$:
;home_defender.c:581: if(shot2.x != 0 && shot2.y != 0){
	ld	a, (#(_shot2 + 4) + 0)
	or	a, a
	jr	Z, 00137$
	ld	bc, #_shot2 + 5
	ld	a, (bc)
	or	a, a
	jr	Z, 00137$
;home_defender.c:582: moveSprites(&shot2, 0, -(shot2.speed));
	ld	hl, #_shot2 + 9
	ld	e, (hl)
	xor	a, a
	sub	a, e
	ld	d, a
	push	bc
	push	de
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ld	de, #_shot2
	push	de
	call	_moveSprites
	add	sp, #4
	pop	bc
;home_defender.c:583: if(shot2.y == 0){
	ld	a, (bc)
	or	a, a
	jr	NZ, 00137$
;home_defender.c:584: shot2.x = 0;
	ld	hl, #(_shot2 + 4)
	ld	(hl), #0x00
;home_defender.c:585: shot2.y = 0;
	xor	a, a
	ld	(bc), a
;home_defender.c:586: moveSprites(&shot2, 0, 0);
	xor	a, a
	rrca
	push	af
	ld	de, #_shot2
	push	de
	call	_moveSprites
	add	sp, #4
00137$:
;home_defender.c:589: if(missile.x != 0 && missile.y != 0){
	ld	a, (#(_missile + 4) + 0)
	or	a, a
	jr	Z, 00142$
	ld	bc, #_missile + 5
	ld	a, (bc)
	or	a, a
	jr	Z, 00142$
;home_defender.c:590: moveSprites(&missile, 0, -(missile.speed));
	ld	hl, #(_missile + 9)
	ld	l, (hl)
;	spillPairReg hl
	xor	a, a
	sub	a, l
	ld	d, a
	ld	hl, #_missile
	push	bc
	push	de
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	hl
	call	_moveSprites
	add	sp, #4
	pop	bc
;home_defender.c:591: if(missile.y == 0){
	ld	a, (bc)
	or	a, a
	jr	NZ, 00142$
;home_defender.c:592: missile.x = 0;
	ld	hl, #(_missile + 4)
	ld	(hl), #0x00
;home_defender.c:593: missile.y = 0;
	xor	a, a
	ld	(bc), a
;home_defender.c:594: moveSprites(&missile, 0, 0);
	xor	a, a
	rrca
	push	af
	ld	de, #_missile
	push	de
	call	_moveSprites
	add	sp, #4
00142$:
;home_defender.c:597: if(a1Cooldown == 30){
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, #0x1e
	jp	NZ,00155$
;home_defender.c:598: if(asteroid1.x == 0){
	ld	a, (#(_asteroid1 + 4) + 0)
	or	a, a
	jr	NZ, 00152$
;home_defender.c:599: asteroid1.x = (rand()%148)+8;
	call	_rand
	ld	d, #0x00
	ld	bc, #0x0094
	push	bc
	push	de
	call	__modsint
	add	sp, #4
	ld	a, e
	add	a, #0x08
	ld	(#(_asteroid1 + 4)),a
	jr	00156$
00152$:
;home_defender.c:601: else if(asteroid1.x != 0 && asteroid1.y < 116 && clock % asteroid2.speed == 0){
	or	a, a
	jr	Z, 00147$
	ld	a, (#(_asteroid1 + 5) + 0)
	sub	a, #0x74
	jr	NC, 00147$
	ld	a, (#(_asteroid2 + 9) + 0)
	push	af
	inc	sp
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	call	__modsuchar
	pop	hl
	ld	a, e
	or	a, a
	jr	NZ, 00147$
;home_defender.c:602: moveSprites(&asteroid1, 0, 2);
	ld	hl, #0x200
	push	hl
	ld	de, #_asteroid1
	push	de
	call	_moveSprites
	add	sp, #4
	jr	00156$
00147$:
;home_defender.c:604: else if(asteroid1.y == 116){
	ld	a, (#(_asteroid1 + 5) + 0)
	sub	a, #0x74
	jr	NZ, 00156$
;home_defender.c:605: a1Cooldown = 0;
	ldhl	sp,	#6
	ld	(hl), #0x00
;home_defender.c:606: earthHealth = earthHealth - 5;
	ld	hl, #_earthHealth
	ld	a, (hl)
	add	a, #0xfb
	ld	(hl), a
;home_defender.c:607: updateWin(0);
	xor	a, a
	push	af
	inc	sp
	call	_updateWin
	inc	sp
;home_defender.c:608: asteroid1.x = 0;
	ld	hl, #(_asteroid1 + 4)
	ld	(hl), #0x00
;home_defender.c:609: asteroid1.y = 0;
	ld	hl, #(_asteroid1 + 5)
	ld	(hl), #0x00
;home_defender.c:610: earthHit = 1;
	ldhl	sp,	#0
	ld	(hl), #0x01
;home_defender.c:611: moveSprites(&asteroid1, 0, 0);
	xor	a, a
	rrca
	push	af
	ld	de, #_asteroid1
	push	de
	call	_moveSprites
	add	sp, #4
	jr	00156$
00155$:
;home_defender.c:615: a1Cooldown++;
	ldhl	sp,	#6
	inc	(hl)
00156$:
;home_defender.c:617: if(a2Cooldown == 50){
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x32
	jp	NZ,00174$
;home_defender.c:618: if(asteroid2.x == 0 && asteroid1.y >= 40){
	ld	hl, #(_asteroid2 + 4)
	ld	c, (hl)
	ld	a, c
	or	a, a
	jp	NZ, 00170$
	ld	a, (#(_asteroid1 + 5) + 0)
	sub	a, #0x28
	jr	C, 00170$
;home_defender.c:619: uint8_t spawn = (rand()%148)+8;
	call	_rand
	ld	d, #0x00
	ld	bc, #0x0094
	push	bc
	push	de
	call	__modsint
	add	sp, #4
	ld	a, e
	add	a, #0x08
	ldhl	sp,	#1
	ld	(hl), a
;home_defender.c:620: if(spawn > asteroid1.x + 24 || spawn < asteroid1.x - 8){
	ld	a, (#(_asteroid1 + 4) + 0)
	ld	c, a
	ld	b, #0x00
	ld	hl, #0x0018
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#2
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00526$
	bit	7, d
	jr	NZ, 00527$
	cp	a, a
	jr	00527$
00526$:
	bit	7, d
	jr	Z, 00527$
	scf
00527$:
	jr	C, 00157$
	ld	a, c
	add	a, #0xf8
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ldhl	sp,	#4
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00528$
	bit	7, d
	jr	NZ, 00529$
	cp	a, a
	jr	00529$
00528$:
	bit	7, d
	jr	Z, 00529$
	scf
00529$:
	jr	NC, 00175$
00157$:
;home_defender.c:621: asteroid2.x = spawn;
	ld	de, #(_asteroid2 + 4)
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(de), a
	jr	00175$
00170$:
;home_defender.c:624: else if(asteroid2.x != 0 && asteroid2.y < 116 && clock % asteroid2.speed == 0){
	ld	hl, #(_asteroid2 + 5)
	ld	b, (hl)
	ld	a, c
	or	a, a
	jr	Z, 00165$
	ld	a, b
	sub	a, #0x74
	jr	NC, 00165$
	ld	a, (#(_asteroid2 + 9) + 0)
	push	bc
	push	af
	inc	sp
	ldhl	sp,	#14
	ld	a, (hl)
	push	af
	inc	sp
	call	__modsuchar
	pop	hl
	ld	a, e
	pop	bc
	or	a, a
	jr	NZ, 00165$
;home_defender.c:625: moveSprites(&asteroid2, 0, 2);
	ld	hl, #0x200
	push	hl
	ld	de, #_asteroid2
	push	de
	call	_moveSprites
	add	sp, #4
	jr	00175$
00165$:
;home_defender.c:627: else if(asteroid2.y == 116){
	ld	a, b
;home_defender.c:628: if(asteroid2.x != 0){
	sub	a,#0x74
	jr	NZ, 00175$
	or	a,c
	jr	Z, 00175$
;home_defender.c:629: a2Cooldown = 0;
	ldhl	sp,	#7
	ld	(hl), #0x00
;home_defender.c:630: earthHealth = earthHealth - 5;
	ld	hl, #_earthHealth
	ld	a, (hl)
	add	a, #0xfb
	ld	(hl), a
;home_defender.c:631: updateWin(0);
	xor	a, a
	push	af
	inc	sp
	call	_updateWin
	inc	sp
;home_defender.c:632: asteroid2.x = 0;
	ld	hl, #(_asteroid2 + 4)
	ld	(hl), #0x00
;home_defender.c:633: asteroid2.y = 0;
	ld	hl, #(_asteroid2 + 5)
	ld	(hl), #0x00
;home_defender.c:634: earthHit =1;
	ldhl	sp,	#0
	ld	(hl), #0x01
;home_defender.c:635: moveSprites(&asteroid2, 0, 0);
	xor	a, a
	rrca
	push	af
	ld	de, #_asteroid2
	push	de
	call	_moveSprites
	add	sp, #4
	jr	00175$
00174$:
;home_defender.c:640: a2Cooldown++;
	ldhl	sp,	#7
	inc	(hl)
00175$:
;home_defender.c:643: if(blastDelay < 10){
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x0a
	jr	NC, 00177$
;home_defender.c:644: blastDelay++;
	inc	(hl)
00177$:
;home_defender.c:646: if(missileDelay < 900){
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x84
	ld	a, b
	sbc	a, #0x03
	jr	NC, 00181$
;home_defender.c:647: missileDelay++;
	dec	hl
	inc	(hl)
	jr	NZ, 00532$
	inc	hl
	inc	(hl)
00532$:
;home_defender.c:648: if(missileDelay == 900){
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x84
	jr	NZ, 00181$
	ld	a, b
	sub	a, #0x03
	jr	NZ, 00181$
;home_defender.c:649: playSounds(5);
	ld	a, #0x05
	push	af
	inc	sp
	call	_playSounds
	inc	sp
00181$:
;home_defender.c:653: checkCollisions(&maverick, &asteroid1, &a1Cooldown);
	ldhl	sp,	#6
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	push	bc
	push	de
	ld	de, #_asteroid1
	push	de
	ld	de, #_maverick
	push	de
	call	_checkCollisions
	add	sp, #6
	pop	bc
;home_defender.c:654: checkCollisions(&maverick, &asteroid2, &a2Cooldown);
	ldhl	sp,	#7
;	spillPairReg hl
;	spillPairReg hl
	ld	e,l
	ld	d,h
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	push	hl
	ld	hl, #_asteroid2
	push	hl
	ld	hl, #_maverick
	push	hl
	call	_checkCollisions
	add	sp, #6
	pop	de
	pop	bc
;home_defender.c:655: checkCollisions(&shot1, &asteroid1, &a1Cooldown);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	push	hl
	ld	hl, #_asteroid1
	push	hl
	ld	hl, #_shot1
	push	hl
	call	_checkCollisions
	add	sp, #6
	pop	de
	pop	bc
;home_defender.c:656: checkCollisions(&shot1, &asteroid2, &a2Cooldown);
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	push	hl
	ld	hl, #_asteroid2
	push	hl
	ld	hl, #_shot1
	push	hl
	call	_checkCollisions
	add	sp, #6
	pop	de
	pop	bc
;home_defender.c:657: checkCollisions(&shot2, &asteroid1, &a1Cooldown);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	push	hl
	ld	hl, #_asteroid1
	push	hl
	ld	hl, #_shot2
	push	hl
	call	_checkCollisions
	add	sp, #6
	pop	de
	pop	bc
;home_defender.c:658: checkCollisions(&shot2, &asteroid2, &a2Cooldown);
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	push	hl
	ld	hl, #_asteroid2
	push	hl
	ld	hl, #_shot2
	push	hl
	call	_checkCollisions
	add	sp, #6
	pop	de
	pop	bc
;home_defender.c:659: checkCollisions(&missile, &asteroid1, &a1Cooldown);
	push	de
	push	bc
	ld	bc, #_asteroid1
	push	bc
	ld	bc, #_missile
	push	bc
	call	_checkCollisions
	add	sp, #6
	ld	de, #_asteroid2
	push	de
	ld	de, #_missile
	push	de
	call	_checkCollisions
	add	sp, #6
;home_defender.c:662: if(lostLife == 1){
	ld	a, (#_lostLife)
	dec	a
	jr	NZ, 00183$
;home_defender.c:663: updateWin(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_updateWin
	inc	sp
;home_defender.c:664: lostLife = 0;
	ld	hl, #_lostLife
	ld	(hl), #0x00
00183$:
;home_defender.c:667: if(currScore >= 500 && currScore < 1000){
	ld	hl, #_currScore
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;home_defender.c:668: asteroid2.speed = 2;
;home_defender.c:667: if(currScore >= 500 && currScore < 1000){
	ld	a, c
	sub	a, #0xf4
	ld	a, b
	sbc	a, #0x01
	jr	C, 00185$
	ld	a, c
	sub	a, #0xe8
	ld	a, b
	sbc	a, #0x03
	jr	NC, 00185$
;home_defender.c:668: asteroid2.speed = 2;
	ld	hl, #(_asteroid2 + 9)
	ld	(hl), #0x02
00185$:
;home_defender.c:670: if(currScore >= 1000 && currScore < 3300){
	ld	hl, #_currScore
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;home_defender.c:671: asteroid1.speed = 2;
	ld	bc, #_asteroid1 + 9
;home_defender.c:670: if(currScore >= 1000 && currScore < 3300){
	ld	a, e
	sub	a, #0xe8
	ld	a, d
	sbc	a, #0x03
	jr	C, 00188$
	ld	a, e
	sub	a, #0xe4
	ld	a, d
	sbc	a, #0x0c
	jr	NC, 00188$
;home_defender.c:671: asteroid1.speed = 2;
	ld	a, #0x02
	ld	(bc), a
00188$:
;home_defender.c:673: if(currScore >= 3300 && currScore < 5000){
	ld	hl, #_currScore
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	sub	a, #0xe4
	ld	a, d
	sbc	a, #0x0c
	jr	C, 00191$
	ld	a, e
	sub	a, #0x88
	ld	a, d
	sbc	a, #0x13
	jr	NC, 00191$
;home_defender.c:674: asteroid2.speed = 1;
	ld	hl, #(_asteroid2 + 9)
	ld	(hl), #0x01
00191$:
;home_defender.c:676: if(currScore >= 5000){
	ld	hl, #_currScore
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	sub	a, #0x88
	ld	a, d
	sbc	a, #0x13
	jr	C, 00194$
;home_defender.c:677: asteroid1.speed = 1;
	ld	a, #0x01
	ld	(bc), a
00194$:
;home_defender.c:680: if(earthHit == 1 && earthHealth > 0 && earthHealth < 100){
	ldhl	sp,	#0
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00538$
	xor	a, a
00538$:
	ld	b, a
	or	a, a
	jr	Z, 00200$
	ld	hl, #_earthHealth
	ld	a, (hl)
	or	a, a
	jr	Z, 00200$
	ld	a, (hl)
	sub	a, #0x64
	jr	NC, 00200$
;home_defender.c:681: earthquake(0, &earthHit);
	ldhl	sp,	#0
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_earthquake
	add	sp, #3
	jr	00201$
00200$:
;home_defender.c:683: else if(earthHit == 1 && (earthHealth > 100 || earthHealth == 0)){
	ld	a, b
	or	a, a
	jr	Z, 00201$
	ld	a, #0x64
	ld	hl, #_earthHealth
	sub	a, (hl)
	jr	C, 00195$
	ld	a, (hl)
	or	a, a
	jr	NZ, 00201$
00195$:
;home_defender.c:684: earthquake(1, &earthHit);
	ldhl	sp,	#0
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	call	_earthquake
	add	sp, #3
00201$:
;home_defender.c:687: clock++;
	ldhl	sp,	#11
	inc	(hl)
;home_defender.c:688: performanceDelay(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_performanceDelay
	inc	sp
	jp	00205$
00207$:
;home_defender.c:691: if(currScore > hiScore){
	ld	de, #_hiScore
	ld	hl, #_currScore
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00209$
;home_defender.c:692: hiScore = currScore;
	ld	a, (#_currScore)
	ld	(#_hiScore),a
	ld	a, (#_currScore + 1)
	ld	(#_hiScore + 1),a
00209$:
;home_defender.c:695: waitpad(J_A);
	ld	a, #0x10
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;home_defender.c:696: resetSprites();
	call	_resetSprites
;home_defender.c:697: }
	add	sp, #12
	ret
;home_defender.c:700: void displayStats(){
;	---------------------------------
; Function displayStats
; ---------------------------------
_displayStats::
	add	sp, #-7
;home_defender.c:705: fadeOut();
	call	_fadeOut
;home_defender.c:706: set_bkg_tiles(0, 0, 20, 18, stats_screen);
	ld	de, #_stats_screen
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;c:/gbdk/include/gb/gb.h:1080: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;home_defender.c:708: printScore(0, 0);
	xor	a, a
	rrca
	push	af
	call	_printScore
	pop	hl
;home_defender.c:709: printScore(0, 1);
	xor	a, a
	inc	a
	push	af
	call	_printScore
	pop	hl
;home_defender.c:711: playsKeeper = numplays;
	ld	hl, #_numplays
	ld	c, (hl)
	ld	b, #0x00
;home_defender.c:712: numPlaysKeeper[0] = 1 + (playsKeeper/100);
	ldhl	sp,	#0
	ld	a, l
	ld	d, h
	ldhl	sp,	#3
	ld	(hl+), a
	ld	(hl), d
	push	bc
	ld	de, #0x0064
	push	de
	push	bc
	call	__divuint
	add	sp, #4
	ldhl	sp,	#7
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	pop	bc
	ldhl	sp,	#5
	ld	a, (hl-)
	dec	hl
	inc	a
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;home_defender.c:713: remainder = playsKeeper - ((playsKeeper/100)*100);
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	a, c
	sub	a, l
	ld	e, a
	ld	a, b
	sbc	a, h
;home_defender.c:715: numPlaysKeeper[1] = 1 + (playsKeeper/10);
	ldhl	sp,	#3
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	push	bc
	ld	hl, #0x000a
	push	hl
	ld	d, a
	push	de
	call	__divuint
	add	sp, #4
	pop	bc
	ld	a, e
	inc	a
	ld	(bc), a
;home_defender.c:717: numPlaysKeeper[2] = 1 + (numplays %10);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	hl, #_numplays
	ld	e, (hl)
	ld	d, #0x00
	push	bc
	ld	hl, #0x000a
	push	hl
	push	de
	call	__modsint
	add	sp, #4
	pop	bc
	ld	a, e
	inc	a
	ld	(bc), a
;home_defender.c:718: set_bkg_tiles(6, 14, 3, 1, numPlaysKeeper);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ld	hl, #0x103
	push	hl
	ld	hl, #0xe06
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;home_defender.c:720: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;home_defender.c:721: fadeIn();
	call	_fadeIn
;home_defender.c:723: waitpad(J_A);
	ld	a, #0x10
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;home_defender.c:725: playSounds(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_playSounds
	inc	sp
;home_defender.c:726: fadeTransition(97, bkg, menu_screen);
	ld	de, #_menu_screen
	push	de
	ld	de, #_bkg
	push	de
	ld	a, #0x61
	push	af
	inc	sp
	call	_fadeTransition
;home_defender.c:728: }
	add	sp, #12
	ret
;home_defender.c:731: void menuSelection(){
;	---------------------------------
; Function menuSelection
; ---------------------------------
_menuSelection::
	dec	sp
;home_defender.c:734: fadeTransition(98, bkg, menu_screen);
	ld	de, #_menu_screen
	push	de
	ld	de, #_bkg
	push	de
	ld	a, #0x62
	push	af
	inc	sp
	call	_fadeTransition
	add	sp, #5
;home_defender.c:736: set_sprite_data(0, 20, sprites);
	ld	de, #_sprites
	push	de
	ld	hl, #0x1400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x01
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), #0x28
;home_defender.c:740: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;home_defender.c:742: selection = 0;
	ld	c, #0x00
;home_defender.c:743: cursorPos = 0;
	ldhl	sp,	#0
	ld	(hl), #0x00
;home_defender.c:745: while(selection != 3){
00126$:
	ld	a, c
	sub	a, #0x03
	jp	Z,00137$
;home_defender.c:747: if(joypad() & J_DOWN){
	call	_joypad
	bit	3, e
	jr	Z, 00104$
;home_defender.c:748: cursorPos++;
	ldhl	sp,	#0
	inc	(hl)
;home_defender.c:749: if(cursorPos > 1){ cursorPos = 0; }
	ld	a, #0x01
	sub	a, (hl)
	jr	NC, 00102$
	ld	(hl), #0x00
00102$:
;home_defender.c:750: playSounds(1);
	push	bc
	ld	a, #0x01
	push	af
	inc	sp
	call	_playSounds
	inc	sp
	pop	bc
;home_defender.c:751: move_sprite(0, 40, 48 + (cursorPos*16));
	ldhl	sp,	#0
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	add	a, #0x30
	ld	b, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), #0x28
;home_defender.c:752: performanceDelay(10);
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	call	_performanceDelay
	inc	sp
	pop	bc
00104$:
;home_defender.c:754: if(joypad() & J_UP){
	call	_joypad
	bit	2, e
	jr	Z, 00108$
;home_defender.c:755: cursorPos--;
	ldhl	sp,	#0
	dec	(hl)
;home_defender.c:756: if(cursorPos > 1){ cursorPos = 1; }
	ld	a, #0x01
	sub	a, (hl)
	jr	NC, 00106$
	ld	(hl), #0x01
00106$:
;home_defender.c:757: playSounds(1);
	push	bc
	ld	a, #0x01
	push	af
	inc	sp
	call	_playSounds
	inc	sp
	pop	bc
;home_defender.c:758: move_sprite(0, 40, 48+(cursorPos*16));
	ldhl	sp,	#0
	ld	a, (hl)
	swap	a
	and	a, #0xf0
	add	a, #0x30
	ld	b, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), #0x28
;home_defender.c:759: performanceDelay(10);
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	call	_performanceDelay
	inc	sp
	pop	bc
00108$:
;home_defender.c:761: if(joypad() & J_B){
	call	_joypad
	bit	5, e
	jr	Z, 00110$
;home_defender.c:762: playSounds(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_playSounds
	inc	sp
;home_defender.c:763: selection = 3;
	ld	c, #0x03
00110$:
;home_defender.c:765: if(joypad() & J_A){
	call	_joypad
	bit	4, e
	jr	Z, 00116$
;home_defender.c:766: playSounds(0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	call	_playSounds
	inc	sp
	pop	bc
;home_defender.c:767: if(cursorPos == 0){ selection = 1; }
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	NZ, 00112$
	ld	c, #0x01
00112$:
;home_defender.c:768: if(cursorPos == 1){ selection = 2; }
	ldhl	sp,	#0
	ld	a, (hl)
	dec	a
	jr	NZ, 00116$
	ld	c, #0x02
00116$:
;home_defender.c:771: if(selection != 0 && selection != 3){
	ld	a, c
	or	a, a
	jr	Z, 00122$
	ld	a, c
	sub	a, #0x03
	jr	Z, 00122$
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	xor	a, a
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;home_defender.c:773: if(selection == 1){
	ld	a, c
	dec	a
	jr	NZ, 00118$
;home_defender.c:774: numplays++;
	ld	hl, #_numplays
	inc	(hl)
;home_defender.c:775: playGame();
	push	bc
	call	_playGame
	call	_displayStats
	pop	bc
00118$:
;home_defender.c:778: if(selection == 2){
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00120$
;home_defender.c:779: displayStats();
	call	_displayStats
00120$:
;home_defender.c:781: set_sprite_data(0, 19, sprites);
	ld	de, #_sprites
	push	de
	ld	hl, #0x1300
	push	hl
	call	_set_sprite_data
	add	sp, #4
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x01
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, #0x30
	ld	(hl+), a
	ld	(hl), #0x28
;home_defender.c:784: cursorPos = 0;
	ldhl	sp,	#0
	ld	(hl), #0x00
;home_defender.c:785: selection = 0;
	ld	c, #0x00
;home_defender.c:786: performanceDelay(10);
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	call	_performanceDelay
	inc	sp
	pop	bc
00122$:
;home_defender.c:788: if(selection == 3){ move_sprite(0, 0, 0); }
	ld	a, c
	sub	a, #0x03
	jp	NZ,00126$
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	xor	a, a
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;home_defender.c:788: if(selection == 3){ move_sprite(0, 0, 0); }
	jp	00126$
00137$:
;home_defender.c:790: }
	inc	sp
	ret
;home_defender.c:793: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;home_defender.c:796: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;home_defender.c:797: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;home_defender.c:798: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;home_defender.c:800: set_bkg_data(0, 172, start_data);
	ld	de, #_start_data
	push	de
	ld	hl, #0xac00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;home_defender.c:801: set_bkg_tiles(0, 0, 20, 18, start_map);
	ld	de, #_start_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;home_defender.c:802: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;home_defender.c:803: numplays = 0;
	ld	hl, #_numplays
	ld	(hl), #0x00
;home_defender.c:805: while(1){
00102$:
;home_defender.c:807: startScreen();
	call	_startScreen
;home_defender.c:810: seed = DIV_REG;
	ldh	a, (_DIV_REG + 0)
	ld	c, a
	ld	b, #0x00
;home_defender.c:811: seed |= (uint16_t)DIV_REG << 8;
	ldh	a, (_DIV_REG + 0)
	ld	e, a
	xor	a, a
	or	a, c
	ld	c, a
	ld	a, e
	or	a, b
	ld	b, a
;home_defender.c:812: initarand(seed);
	push	bc
	call	_initarand
	pop	hl
;home_defender.c:814: menuSelection();
	call	_menuSelection
;home_defender.c:816: fadeTransition(172, start_data, start_map);
	ld	de, #_start_map
	push	de
	ld	de, #_start_data
	push	de
	ld	a, #0xac
	push	af
	inc	sp
	call	_fadeTransition
	add	sp, #5
;home_defender.c:818: }
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
