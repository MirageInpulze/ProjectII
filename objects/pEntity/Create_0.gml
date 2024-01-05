/// @description Insert description here
// You can write your code in this editor
z = 0;
flash = 0;
flashShader = shWhiteFlash;
uFlash = shader_get_uniform(flashShader, "flash");
lifted = false;
collisionMap = layer_tilemap_get_id(layer_get_id("lCollision"));
enum STATES
{
	DEFAULT,
	LIFTED,
	THROWN,
	LANDED
}

state = STATES.DEFAULT;
thrownCollision = false;
throwSpeed = 3;
entityDropList = -1

//z = 0;
//flash = 0;
//flashShader = shWhiteFlash;
//uFlash = shader_get_uniform(flashShader, "flash");

//enum STATES
//{
//    DEFAULT,
//    LIFTED,
//    THROWN,
//    LANDED
//}

//state = STATES.DEFAULT;
//thrownCollision = false;
//throwSpeed = 3;
//obj_state = STATES.DEFAULT;




