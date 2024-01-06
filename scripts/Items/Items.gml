// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UseItemBomb()
{
	if (global.playerAmmo[item.bomb] > 0) && (global.iLifted == noone)
	{
		global.playerAmmo[item.bomb]--;
		var _bomb = instance_create_layer(x, y, "Instances", oBomb);
		ActivateLiftable(_bomb);
		
	}
}

function UseItemBow()
{
	if (global.playerAmmo[item.bow] > 0) && (global.iLifted == noone)
	{
		global.playerAmmo[item.bow]--;
		PlayerActOutAnimation(sPlayerBow, PlayerFireArrow());
		
	}
}

function PlayerFireArrow()
{
	
	with (instance_create_depth(floor(x), floor(y)-7, depth, oArrow))
	{
		direction = other.direction;
		direction = CARDINAL_DIR * 90;
		image_speed = 0;
		image_index =CARDINAL_DIR;
		speed = 6;
		
	}
}

function UseItemHook()
{
	state = PlayerHook;
	
}

function PurchaseItem(_item, _amount, _cost)
{
	if (global.playerMoney >= _cost)
	{
		global.playerHasAnyItems = true;
		global.playerItemUnlocked[_item] = true;
		global.playerAmmo[_item] += _amount;
		global.playerMoney -= _cost;
		global.playerEquipped = _item;
		var _desc = "";
		switch (_item)
		{
			case item.bow: _desc = "Peforate From Afar! Fire with Right Mouse Button!\nCan reach insurmountable fire cycling speed due to unrestricted fire cooldown..." break;
			case item.bomb: _desc = "Excavate The World! Ignite with Right Mouse Button then toss with Spacebar!\nNow with impact triggers due to low quality materials..." break;
			case item.hook: _desc  = "Express Delivery! Pull to or towards objects with Right Mouse Button!\nTotally not a ripoff from some other franchise..." break;
			default: _desc = "You might wanna contact the dev when you see this line..."
		}
		NewTextBox(_desc, 1);
	}
	else
	{
		NewTextBox("You need more coins to buy that...\nThough they are not going away anytime soon! Come back when you have enough!",1);
	}
}