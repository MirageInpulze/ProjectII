// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//function CalcAttack(mask_index)
//{
//var hitByAttackNow = ds_list_create();
//var hits = instance_place_list(x, y, pEntity, hitByAttackNow, false);
//	if (hits > 0)
//	{
//		for (var i = 0; i < hits; i++)
//		{
//			//If instance has not been hit by this attack, hit
//			var hitID = hitByAttackNow[| i];
//			if (ds_list_find_index(hitByAttack, hitID) == -1)
//			{
//				ds_list_add(hitByAttack, hitID);
//				with(hitID)
//				{
				

//					
				
				
//				}
			
//			}
//		}
//	}
//mask_index = sPlayerAttackSlashHB
//}

function CalcAttack(_hitbox)
{
	mask_index = _hitbox;
	var _hitByAttackNow = ds_list_create();
	var _hits = instance_place_list(x, y, pEntity, _hitByAttackNow, false);	
	if (_hits > 0)
	{
		for (var _i = 0; _i < _hits; _i++)
		{
			// if this instance has not yet been hit by this attack hit it
			var _hitID = _hitByAttackNow[| _i];
			if (ds_list_find_index(hitByAttack, _hitID) == -1)
			{
				ds_list_add(hitByAttack, _hitID);
				with(_hitID)
				{
					if (object_is_ancestor(object_index, pEnemy))
					{
						HurtEnemy(id, 1, other.id, 10);
					}
					else if (entityHitScript != -1) script_execute(entityHitScript)
				}
			}
		}
	}
	ds_list_destroy(_hitByAttackNow);
	mask_index = sPlayerWalk;
}

function HurtEnemy(_enemy, _damage, _source, _knockback)
{
	with (_enemy)
	{
		if (state != enemystate.die && flash == 0)
		{
			enemyHP -= _damage;
			flash = 1;
			image_index = 0;
			knockback = _knockback > 0;
			if (knockback)
			{
				var _knockDirection = point_direction(_source.x, _source.y, x, y);
				xTo = x + lengthdir_x(_knockback, _knockDirection);
				yTo = y + lengthdir_y(_knockback, _knockDirection);
			}
			//Hurt or dead?
			if (enemyHP <= 0)
				state = enemystate.die;
			else
			{
				if (state != enemystate.hurt)
					statePrevious = state;
				state = enemystate.hurt;
			}
		}
	}
}
	

function AttackSlash()
{
	if (sprite_index != sPlayerAttackSlash)
	{
		//Animation setup
		sprite_index = sPlayerAttackSlash
		localFrame = 0;
		image_index = 0;
		
		//Clear hitlist
		if (!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create();
		ds_list_clear(hitByAttack);
		
	}
	
	CalcAttack(sPlayerAttackSlashHB)
	
	FourDirectionAnimate();
	if (animationEnd)
	{
		state = PlayerWalking;
		animationEnd = false;
	}
}