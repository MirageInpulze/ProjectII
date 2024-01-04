//// Script assets have changed for v2.3.0 see
//// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function PlayerWalking(){
	if (_inputM != 0)
	{
		direction = _inputD;	
		image_speed = 1;
	}
	else
	{
		image_speed = 0;
		animIndex = 0;
	}

hSpeed = lengthdir_x(spdWalk*_inputM,_inputD);
vSpeed = lengthdir_y(spdWalk*_inputM,_inputD);

PlayerCollision();
sprite_index = spriteWalk;
FourDirectionAnimate();

	if (keyAttack)
	{
		state = PlayerAttack;
		stateAttack = AttackSlash;
	}


	if (keyRoll)
	{
		state = PlayerRoll;
		moveDistanceRemaining = distanceRoll;
	}
	
	if (keyActivate)
	{
			if (!global.isTextboxClosed) 
		{
			//Check Entity
			//If there is no sctipt-do something else
			//If there is-activate
			//If activates NPC, turn NPC at player
			//var _activateX = lengthdir_x(10, direction);
			//var _activateY = lengthdir_y(10, direction);
			//activate = instance_position(x + _activateX, y + _activateY, pEntity);
		
			//if (activate == noone || activate.entityActivateScript == -1)
			//{
			//	//Does something later
			//}
			//else
			//{
			//	script_execute_ext(activate.entityActivateScript,activate.entityActivateArgs);
			//	if (activate.entityNPC)
			//	{
			//		with(activate)
			//		{
		    //        image_index = (other.direction/90)-2;
			//		}	
			//	}
			//}
			if (global.iLifted = noone){
			 var _e = instance_nearest(x, y, pEntity);
			}
			else if (global.iLifted != noone){
				var _e = Instance_Nearest_Without_Value(x, y, pEntity, "entityActivateScript", -1);
				if ((point_distance(x, y, _e.x, _e.y) > 25) || Instance_Nearest_With_Value(x, y, pEntity, "entityActivateScript", global.iLifted)){
					PlayerThrow();
				}
			  }
			 
			 
		if (_e != noone)
		{
			if (point_distance(x, y, _e.x, _e.y) < 25)
			{
				//Face Player
				if (_e.entityNPC)

				{
					with (_e) 
					{
						direction = point_direction(x, y, other.x, other.y);
						image_index = (other.direction/90)-2;
					}
				}
				
				//ActivateScript
				if (_e.entityActivateScript != -1)
				{
					script_execute_ext(_e.entityActivateScript, _e.entityActivateArgs);
				}				
			}
		}
		}
	else global.isTextboxClosed = false;
	}
}
function PlayerLocked(){
	//Legit do nothing
}


function PlayerRoll()
{
	hSpeed = lengthdir_x(spdRoll, direction);
	vSpeed = lengthdir_y(spdRoll, direction);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - spdRoll);
	var _collided = PlayerCollision();
	
	//Update Sprite
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIR * _totalFrames) + min((( 1 - (moveDistanceRemaining/distanceRoll)) * _totalFrames), _totalFrames -1);
	
	
	if (moveDistanceRemaining <= 0)
	{
		state = PlayerWalking;
	}
	
	if(_collided)
	{
		state = PlayerCollided;
		moveDistanceRemaining = distanceCollided;
		ScreenShake(8, 30)
	}
}

function PlayerCollided()
{
	hSpeed = lengthdir_x(spdCollided, direction-180);
	vSpeed = lengthdir_y(spdCollided, direction-180);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - spdRoll);
	var _collided = PlayerCollision();
	
	//Update Sprite
	sprite_index = sPlayerCollided;
	image_index = CARDINAL_DIR
	
	//Change Height
	z = 2*sin(((moveDistanceRemaining / distanceCollided) * pi) * distanceCollidedHeight);
	
	
	if (moveDistanceRemaining <= 0)
	{
		state = PlayerWalking;
	}
}

function PlayerAttack()
{
	script_execute(stateAttack)
}

function PlayerStateAct()
{
	FourDirectionAnimate();
	if (animationEnd)
	{
		state =  PlayerWalking;
		animationEnd = false;
		if (animationEndScript != -1)
		{
			script_execute(animationEndScript);
			animationEndScript = -1;
		}
	}
}

function PlayerActOutAnimation(sprite, endScript = -1)

{
	//Carry out an animation and optionally carry out a script when the animation ends
	state = PlayerStateAct;
	sprite_index = sprite;
	animationEndScript = endScript;
	localFrame = 0;
	image_index = 0;
	FourDirectionAnimate();

}

function TileCollision()
{
	var collision = false;
	if (tilemap_get_at_pixel(collisionMap, x+hSpeed, y))
	{
		x -= x mod TILE_SIZE;
		if (hSpeed > 0) x += TILE_SIZE - 1;
		spd = 0;
		collision = true;
	}
	else
		x += hSpeed;
	if (tilemap_get_at_pixel(collisionMap, x, y+vSpeed))
	{
		y -= y mod TILE_SIZE;
		if (vSpeed > 0) y += TILE_SIZE - 1;
		spd = 0;
		collision = true;
	}
	else
		y += vSpeed;
	return collision;
}

function ActivateLiftable(id)
{
	if (global.iLifted == noone)
	{
		PlayerActOutAnimation(sPlayerLift);
		global.iLifted = id;
		with (global.iLifted)
		{
			obj_state = STATES.LIFTED;
			persistent = true;
			entityCollision = false;
			entityActivateScript = -1;
		}
	}
}

function PlayerThrow()
{
	with (global.iLifted)
	{
		obj_state = STATES.THROWN;
		persistent = false;
		direction = other.direction;
		z = 13;
		throwPeakHeight = z + 10;
		throwDistanceTravelled = 0;
		throwStartPercent = (13/throwPeakHeight) * 0.5;
		throwPercent = throwStartPercent;
	}
	PlayerActOutAnimation(sPlayerLift);
	global.iLifted = noone;
}

function Instance_Nearest_Without_Value(x, y, obj, variable_name, variable_value){
var distance = 26;
var nearest = undefined;

if (instance_exists(obj)){
	for (var i = 0; i < instance_number(obj); i++){
		var inst = instance_find(obj, i);
		if (variable_instance_exists(inst, variable_name)){
			if (variable_instance_get(inst, variable_name) != variable_value){
				var dist = point_distance(x, y, inst.x, inst.y);
				if (dist < distance){
					distance = dist;
					nearest = inst;
				}
			}
		}
	}
}
return nearest;
}

function Instance_Nearest_With_Value(x, y, obj, variable_name, variable_value){
var distance = 26;
var nearest = undefined;

if (instance_exists(obj)){
	for (var i = 0; i < instance_number(obj); i++){
		var inst = instance_find(obj, i);
		if (variable_instance_exists(inst, variable_name)){
			if (variable_instance_get(inst, variable_name) == variable_value){
				var dist = point_distance(x, y, inst.x, inst.y);
				if (dist < distance){
					distance = dist;
					nearest = inst;
				}
			}
		}
	}
}
return nearest;
}