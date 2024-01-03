// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlimeWander()
{
	sprite_index = sprMove;
	//At destination or done?
	if ((x == xTo) && (y == yTo)) || (timePassed > enemyWanderDistance / enemySpeed)
	{
		hSpeed = 0;
		vSpeed = 0;
		//End move
		if (image_index < 1)
		{
			image_speed = .0;
			image_index = 0;
			
		}
		//Set new destination
		if (++wait >= waitDuration)
		{
			wait = 0;
			timePassed = 0;
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
			
		}
	}
	else //Move to new destination
	{
		timePassed++;
		image_speed = 1.0;
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		var _speedThisFrame = enemySpeed;
		if (_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_speedThisFrame, dir);
		vSpeed = lengthdir_y(_speedThisFrame, dir);
		//Flipping sprite based on direction
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		//Collide and Move
		var _collided = EnemyTileCollision();
		
	}
	// Aggro Check
	if (++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		if (instance_exists(oPlayer)) && (point_distance(x, y, oPlayer.x, oPlayer.y) <= enemyAggroRadius)
		{
			state = enemystate.chase;
			target = oPlayer;
			
			
		}
		
	}
}

function SlimeChase()
{
	sprite_index = sprMove;
	if (instance_exists(target))
	{
		xTo = target.x;
		yTo = target.y;
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		image_speed = 1.0;
		dir = point_direction(x, y, xTo, yTo);
		if (_distanceToGo > enemySpeed)
		{
			hSpeed = lengthdir_x(enemySpeed, dir);
			vSpeed = lengthdir_y(enemySpeed, dir);
			
		}
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		//Collison and Move
		EnemyTileCollision();
	}
	//Too far abandon
	if (_distanceToGo >= enemyGiveUpRange) state = enemystate.wander;
	//Close enough strike
	if (instance_exists(target) && (point_distance(x, y, target.x, target.y) <= enemyAttackRadius))
	{
		state = enemystate.attack;
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1.0;
		//target 8 pixel past the player
		xTo += lengthdir_x(8, dir);
		yTo += lengthdir_y(8, dir);
		
	}
}

function EnemyWait()
{
	sprite_index = sprMove
	if (++stateWait >= stateWaitDuration)
	{
		stateWait = 0;
		state = stateTarget;
	}
	
}

function SlimeAttack()
{
	
	//How fast to move
	var _spd = enemySpeed;
	
	//Don't move while priming to jump
	if (image_index < 2) _spd = 0;
	
	//Freeze animation while in air, finishes when land
	if (floor(image_index) == 3) || (floor(image_index) == 5) image_speed = 0;
	//How far to jump
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	//start landing end of animation once almost done
	if (_distanceToGo < 4) && (image_index < 5) image_speed = 1.0;
	//Move
	if (_distanceToGo > _spd)
	{
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_spd, dir);
		vSpeed = lengthdir_y(_spd, dir);
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		//Commit to move and stop moving if hit wall
		if (EnemyTileCollision() = true)
		{
			xTo = x;
			yTo = y;
		}
		
	}
	else
	{
		x = xTo;
		y = yTo;
		if (floor(image_index) <= 5)
		{
			stateTarget = enemystate.chase;
			stateWaitDuration = 30;
			state = enemystate.wait;
		}
	}
}

function SlimeHurt()

{
	sprite_index = sSlimeHurt;
	image_speed = 1;
	if (knockback)
	{
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		var _direction = point_direction(x, y, xTo, yTo);
		var _speed = (_distanceToGo > enemySpeed ? enemySpeed : _distanceToGo);
		hSpeed = lengthdir_x(_speed, _direction);
		vSpeed = lengthdir_y(_speed, _direction);
		if (hSpeed != 0)
			image_xscale = -sign(hSpeed);
		//Collide & move, if there's a collision, then stop knockback
		if (EnemyTileCollision())
			knockback = false;
	}
	if (flash == 0)
		state = (statePrevious != enemystate.attack ? statePrevious : enemystate.chase);
}

function SlimeDie()
{
	sprite_index = sprDie;
	image_speed = 1.0;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	if (_distanceToGo > enemySpeed)
	{
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(enemySpeed, dir);
		vSpeed = lengthdir_y(enemySpeed, dir);
		if (hSpeed != 0) image_xscale = -sign(hSpeed);
		
		//collide and move
		EnemyTileCollision();
	}
	else
	{
		x = xTo;
		y = yTo;
	}
	//if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps) >= image_number)
	if (image_index > image_number - 1)
	{
		instance_destroy();
	}
}

function EnemyTileCollision()
{
	var _collision = false;
	if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y))
	{
		x -= x mod TILE_SIZE;
		if (sign(hSpeed) == 1) x += TILE_SIZE - 1;
		hSpeed = 0;
		_collision = true;
		
	}
	x += hSpeed;
	
		if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
	{
		y -= y mod TILE_SIZE;
		if (sign(vSpeed) == 1) y += TILE_SIZE - 1;
		vSpeed = 0;
		_collision = true;
		
	}
	y += vSpeed;
	
	return _collision;
}