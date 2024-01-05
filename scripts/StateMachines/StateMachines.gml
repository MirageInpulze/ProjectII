// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

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
			 
			if (global.iLifted = noone)
			{
				var _e = instance_nearest(x, y, pEntity);
			}
			else if (global.iLifted != noone){
				if(Instance_Nearest_Without_Value(x,y,pEntity,"entityActivateScript",-1)!=undefined){
					var _e = Instance_Nearest_Without_Value(x,y,pEntity,"entityActivateScript",-1);
				}
				else{
					var _e = instance_nearest(x, y, pEntity);
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
	if (keyItem) && (!keyActivate) && (global.playerHasAnyItems) && (global.playerEquipped != item.none)
	{
		switch (global.playerEquipped)
		{
		case item.bomb: UseItemBomb() ;break;
		case item.bow: UseItemBow() ;break;
		case item.hook: UseItemHook() ;break;
		default: break;
		}
	}
	
	//CycleItems
	if (global.playerHasAnyItems)
	{
		var _cycleDirection = keyItemSelectUp - keyItemSelectDown;
		if (_cycleDirection != 0)
		{
			do
			{
				global.playerEquipped += _cycleDirection;
				if (global.playerEquipped <1) global.playerEquipped = item.TYPE_COUNT - 1;
				if (global.playerEquipped >= item.TYPE_COUNT) global.playerEquipped = 1;
				
			}
			until (global.playerItemUnlocked[global.playerEquipped]);
			
		}
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
		spriteWalk = sPlayerRunCarrying;
		
		global.iLifted = id;
		with (global.iLifted)
		{
			state = STATES.LIFTED;
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
		state = STATES.THROWN;
		persistent = false;
		direction = other.direction;
		z = 13;
		throwPeakHeight = z + 10;
		throwDistanceTravelled = 0;
		throwStartPercent = (13/throwPeakHeight) * 0.5;
		throwPercent = throwStartPercent;
	}
	PlayerActOutAnimation(sPlayerLift);
	spriteWalk = sPlayerWalk;
	global.iLifted = noone;
}

function PlayerDead()
{
	hSpeed = 0;
	vSpeed = 0;
	
	//if just arrived in state
	if (sprite_index != sPlayerDie) && (sprite_index != sPlayerDead)
	{
		//update sprite
		sprite_index = sPlayerDie
		image_index = 0;
		image_speed = .7;
	}
	//Animation ending this frame?
	if (image_index + image_speed > image_number)
	{
		if (sprite_index == sPlayerDie)
		{
			image_speed = max(0, image_speed -.03)
			if (image_speed < .07)
			{
				image_index = 0;
				sprite_index = sPlayerDead;
				image_speed = 1.0;
			}
		}
		else
		{
			image_speed = 0;
			image_index = image_number -1;
			global.targetX = -1;
			global.targetY = -1
			room_goto(ROOM_START);
		}
	}
}

function PlayerHook()
{
	hSpeed = 0;
	vSpeed = 0;
	
	//Just arrived in state
	if (sprite_index != sPlayerHook)
	{
		hook = 0;
		hookX = 0;
		hookY = 0;
		hookStatus = hookstatus.extending;
		hookedEntity = noone;
		
		//update sprite
		sprite_index = sPlayerHook;
		image_index = CARDINAL_DIR;
		image_speed = 0;
	}
	
	 //Extend/Restract hook:
	var _spdHookTemp = spdHook;
	//var _spdHookTemp = (hookStatus == hookstatus.extending ? spdHook : -spdHook);
	if (hookStatus != hookstatus.extending) _spdHookTemp *= -1;
	hook += _spdHookTemp;
	switch (image_index)
	{
		case 0: hookX = hook; break;
		case 1: hookY = -hook; break;
		case 2: hookX = -hook; break;
		case 3: hookY = hook; break;
	}
		//Hookshot statemachine
		switch (hookStatus)
		{
			case hookstatus.extending:
			{
				//Finish extendng
				if (hook >= distanceHook) hookStatus = hookstatus.missed;
				
				//hitscan
				var _hookHit = collision_circle(x+hookX, y+hookY, 4, pEntity, false, true);
				if (_hookHit != noone) && (global.iLifted != _hookHit)
				{
					//Act based on what got hit
					switch (_hookHit.entityHookable)
					{
						default: //not hookable
						{
							//... else potentially harm enemy
							if (object_is_ancestor(_hookHit.object_index,pEnemy))
							{
								HurtEnemy(_hookHit,1,id,1);
								hookStatus = hookstatus.missed;
							}
							else
							{
								if (_hookHit.entityHitScript != -1)
								{
									with (_hookHit) script_execute(entityHitScript)
									hookstatus = hookstatus.missed
								}
							}				
						}
						break;
						case 1:
						{
							hookStatus = hookstatus.pulltoplayer
							hookedEntity = _hookHit;
						}
						break;
						case 2:
						{
							hookStatus = hookstatus.pulltoentity;
							hookedEntity = _hookHit;				
						}
						break;
					}					
				}
			}
			break;
			//Pull entity towards hooked player
			case hookstatus.pulltoplayer:
			{
				//Update distance and direction extended
				with (hookedEntity)
				{
					x = other.x + other.hookX;
					y = other.y + other.hookY;
				}
			}
			break;
			
			//Pull player towards entity
			case hookstatus.pulltoentity:
			{
				//Update distance and direction extended
				switch (image_index)
				{
					case 0: x += spdHook; break;
					case 1: y -= spdHook; break;
					case 2: x -= spdHook; break;
					case 3: y += spdHook; break;
				}
			}
			break;
		}
		
		//Finish retract then end state
		if (hook <= 0)
		{
			hookedEntity = noone;
			state = PlayerWalking;
		}
}

//// Script assets have changed for v2.3.0 see
//// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//function PlayerWalking(){
//	if (_inputM != 0)
//	{
//		direction = _inputD;	
//		image_speed = 1;
//	}
//	else
//	{
//		image_speed = 0;
//		animIndex = 0;
//	}

//hSpeed = lengthdir_x(spdWalk*_inputM,_inputD);
//vSpeed = lengthdir_y(spdWalk*_inputM,_inputD);

//PlayerCollision();
//sprite_index = spriteWalk;
//FourDirectionAnimate();

//	if (keyAttack)
//	{
//		state = PlayerAttack;
//		stateAttack = AttackSlash;
//	}


//	if (keyRoll)
//	{
//		state = PlayerRoll;
//		moveDistanceRemaining = distanceRoll;
//	}
	
//	if (keyActivate)
//	{
//			if (!global.isTextboxClosed) 
//		{
//			//Check Entity
//			//If there is no sctipt-do something else
//			//If there is-activate
//			//If activates NPC, turn NPC at player
//			//var _activateX = lengthdir_x(10, direction);
//			//var _activateY = lengthdir_y(10, direction);
//			//activate = instance_position(x + _activateX, y + _activateY, pEntity);
		
//			//if (activate == noone || activate.entityActivateScript == -1)
//			//{
//			//	//Does something later
//			//}
//			//else
//			//{
//			//	script_execute_ext(activate.entityActivateScript,activate.entityActivateArgs);
//			//	if (activate.entityNPC)
//			//	{
//			//		with(activate)
//			//		{
//		    //        image_index = (other.direction/90)-2;
//			//		}	
//			//	}
//			//}
//			if (global.iLifted = noone){
//			 var _e = instance_nearest(x, y, pEntity);
//			}
//			else if (global.iLifted != noone){
//				var _e = Instance_Nearest_With_Value(x, y, pEntity, "type", "npc");
//				if (point_distance(x, y, _e.x, _e.y) > 25){
//					PlayerThrow();
//				}
//			  }
			 
			 
//		if (_e != noone)
//		{
//			if (point_distance(x, y, _e.x, _e.y) < 25)
//			{
//				//Face Player
//				if (_e.entityNPC)

//				{
//					with (_e) 
//					{
//						direction = point_direction(x, y, other.x, other.y);
//						image_index = (other.direction/90)-2;
//					}
//				}
				
//				//ActivateScript
//				if (_e.entityActivateScript != -1)
//				{
//					script_execute_ext(_e.entityActivateScript, _e.entityActivateArgs);
//				}				
//			}
//		}
//		}
//	else global.isTextboxClosed = false;
//	}
//}
//function PlayerLocked(){
//	//Legit do nothing
//}


//function PlayerRoll()
//{
//	hSpeed = lengthdir_x(spdRoll, direction);
//	vSpeed = lengthdir_y(spdRoll, direction);
	
//	moveDistanceRemaining = max(0, moveDistanceRemaining - spdRoll);
//	var _collided = PlayerCollision();
	
//	//Update Sprite
//	sprite_index = spriteRoll;
//	var _totalFrames = sprite_get_number(sprite_index)/4;
//	image_index = (CARDINAL_DIR * _totalFrames) + min((( 1 - (moveDistanceRemaining/distanceRoll)) * _totalFrames), _totalFrames -1);
	
	
//	if (moveDistanceRemaining <= 0)
//	{
//		state = PlayerWalking;
//	}
	
//	if(_collided)
//	{
//		state = PlayerCollided;
//		moveDistanceRemaining = distanceCollided;
//		ScreenShake(8, 30)
//	}
//}

//function PlayerCollided()
//{
//	hSpeed = lengthdir_x(spdCollided, direction-180);
//	vSpeed = lengthdir_y(spdCollided, direction-180);
	
//	moveDistanceRemaining = max(0, moveDistanceRemaining - spdRoll);
//	var _collided = PlayerCollision();
	
//	//Update Sprite
//	sprite_index = sPlayerCollided;
//	image_index = CARDINAL_DIR
	
//	//Change Height
//	z = 2*sin(((moveDistanceRemaining / distanceCollided) * pi) * distanceCollidedHeight);
	
	
//	if (moveDistanceRemaining <= 0)
//	{
//		state = PlayerWalking;
//	}
//}

//function PlayerAttack()
//{
//	script_execute(stateAttack)
//}

//function PlayerStateAct()
//{
//	FourDirectionAnimate();
//	if (animationEnd)
//	{
//		state =  PlayerWalking;
//		animationEnd = false;
//		if (animationEndScript != -1)
//		{
//			script_execute(animationEndScript);
//			animationEndScript = -1;
//		}
//	}
//}

//function PlayerActOutAnimation(sprite, endScript = -1)

//{
//	//Carry out an animation and optionally carry out a script when the animation ends
//	state = PlayerStateAct;
//	sprite_index = sprite;
//	animationEndScript = endScript;
//	localFrame = 0;
//	image_index = 0;
//	FourDirectionAnimate();

//}

//function TileCollision()
//{
//	var collision = false;
//	if (tilemap_get_at_pixel(collisionMap, x+hSpeed, y))
//	{
//		x -= x mod TILE_SIZE;
//		if (hSpeed > 0) x += TILE_SIZE - 1;
//		spd = 0;
//		collision = true;
//	}
//	else
//		x += hSpeed;
//	if (tilemap_get_at_pixel(collisionMap, x, y+vSpeed))
//	{
//		y -= y mod TILE_SIZE;
//		if (vSpeed > 0) y += TILE_SIZE - 1;
//		spd = 0;
//		collision = true;
//	}
//	else
//		y += vSpeed;
//	return collision;
//}

//function ActivateLiftable(id)
//{
//	if (global.iLifted == noone)
//	{
//		PlayerActOutAnimation(sPlayerLift);
//		global.iLifted = id;
//		with (global.iLifted)
//		{
//			obj_state = STATES.LIFTED;
//			persistent = true;
//			entityCollision = false;
//			entityActivateScript = -1;
//		}
//	}
//}

//function PlayerThrow()
//{
//	with (global.iLifted)
//	{
//		obj_state = STATES.THROWN;
//		persistent = false;
//		direction = other.direction;
//		z = 13;
//		throwPeakHeight = z + 10;
//		throwDistanceTravelled = 0;
//		throwStartPercent = (13/throwPeakHeight) * 0.5;
//		throwPercent = throwStartPercent;
//	}
//	PlayerActOutAnimation(sPlayerLift);
//	global.iLifted = noone;
//}

function Instance_Nearest_Without_Value(x, y, obj, variable_name, variable_value){
var distance = 25;
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
var distance = 25;
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

//function PlayerDropItem()
//{
//	with (oPlayer)
//	global.iLifted = noone;
//	spriteWalk = sPlayerWalk;
	
//}