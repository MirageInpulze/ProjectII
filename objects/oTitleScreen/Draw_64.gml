/// @description Insert description here
// You can write your code in this editor

if (titleVisible > 0)
{
	draw_sprite(sTitle, 0,0,-RESOLUTION_H + titleVisible*RESOLUTION_H);
	draw_set_alpha(titleVisible * abs(sin(get_timer()* .00001 * pi)))
	draw_sprite(sTitle,1,0,0);
	draw_set_alpha(1.0);
	
}

if (slotsVisible > 0)
{
	draw_set_alpha(slotsVisible)
	for (var _slot = 0; _slot <= 2; _slot++)
	{
		var _y = 16+_slot*48
		var _x = 60;
		var _img = 2;
		if(slotsSelected == _slot)
		{
			_img = 3;
			draw_sprite(sMenuPlayer,0,_x-32,_y+24);
		}
	draw_sprite_stretched(sTextBox, _img, _x, _y, 200, 48)
	
	draw_set_font(fnM5x7)
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	if (slotsData[_slot] == -1 || slotsData[_slot] == undefined) // empty save file
	{
		draw_text(_x + 8, _y+8, "Start New Game");
	}
	else
	{
		draw_text(_x + 8, _y+8, RoomToAreaName(slotsData[_slot][? "room"]));
		
		var _playerHealth = slotsData[_slot][? "playerHealth"]
		var _playerHealthMax = slotsData[_slot][? "playerHealthMax"];
		var _playerHealthFrac = frac(_playerHealth);
		_playerHealth -= _playerHealthFrac;
		for ( var i =1; i <= _playerHealthMax; i++)
		{
			var _imageIndex = (i > _playerHealth);
			if (i == _playerHealth+1)
			{
				_imageIndex += (_playerHealthFrac > 0);
				_imageIndex += (_playerHealthFrac > .25);
				_imageIndex += (_playerHealthFrac > .5);
			}
			draw_sprite(sHealth, _imageIndex, _x + 48 + ((i-1)*16), _y +24);
		}
		
		//Draw Money
		draw_sprite(sCoinUI,0,_x+8,_y+28);
		draw_text(_x+20, _y+24, slotsData[_slot][? "playerMoney"]);
		}
	}
	draw_set_alpha(1.0)
}


