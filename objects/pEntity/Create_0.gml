/// @description Insert description here
// You can write your code in this editor
z = 0;
flash = 0;
uFlash = shader_get_uniform(shWhiteFlash, "flash");

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






