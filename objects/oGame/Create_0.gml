/// @description Insert description here
// You can write your code in this editor
randomize();

global.GamePaused = false;
global.textspeed = .75;
global.isTextboxClosed = false;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;
global.playerMoney = 0;
global.playerHealthMax = 3;
global.playerHealth = global.playerHealthMax;

//Items
global.playerHasAnyItems = false;
global.playerEquipped = item.bomb;
global.playerAmmo = array_create(item.TYPE_COUNT, -1);
global.playerItemUnlocked = array_create(item.TYPE_COUNT, false);
global.playerAmmo[item.bomb] = 0;
global.playerAmmo[item.bow] = 0;

//TODO: DELETE THESE
global.playerHasAnyItems = true;
global.playerItemUnlocked[item.bomb] = true;
global.playerAmmo[item.bomb] = 5;

global.questStatus = ds_map_create();
global.questStatus [? "TheHatQuest"] = 0;

global.iLifted = noone;
global.iCamera = instance_create_layer(0,0,layer,oCamera);
global.iUI = instance_create_layer(0,0,layer,oUI);
surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
room_goto(ROOM_START);



