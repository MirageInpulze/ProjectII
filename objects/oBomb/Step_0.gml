/// @description Insert description here
// You can write your code in this editor

event_inherited();

if (!global.GamePaused)
{
	bombTick--;
	if (bombTick == 0)
	{
		flash = .75;
		bombStage++;
		bombTick = bombTickRate[bombStage];
	}
	
	if (bombTick < 0)
	{
		y -= z;
		if (lifted)
		{
			PlayerDropItem();
		}
		instance_destroy();
	}
	
}




