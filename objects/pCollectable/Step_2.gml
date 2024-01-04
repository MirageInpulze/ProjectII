/// @description Insert description here
// You can write your code in this editor

flash= max(0 , flash-0.05);
fric=0.05;
if (z==0)fric = 0.10;

//Magnetize
if (instance_exists(oPlayer))
{
	var _px = oPlayer.x;
	var _py = oPlayer.y;
	var _dist = point_distance(x,y,_px,_py)
	if (_dist < 16)
	{
		spd += .25;
		direction = point_direction(x, y, _px, _py);
		spd = min (spd, 3);
		fric = 0;
		if (_dist < 5) //collect radius
		{
			if (collectScriptArg != -1)
			{
				script_execute(collectScript, collectScriptArg);
			}
			else
			{
				if (collectScript != -1) script_execute(collectScript);
			}
			instance_destroy();
		}
	}
}


x += lengthdir_x(random_range(0,spd),direction);
y += lengthdir_y(random_range(0,spd),direction);
spd = max(spd-fric,0);
depth=-bbox_bottom;


