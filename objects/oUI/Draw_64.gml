/// @description Insert description here
// You can write your code in this editor
//Draw Health
var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
var _playerHealthFrac = frac(_playerHealth);
_playerHealth -= _playerHealthFrac;

for (var i = 1; i<= _playerHealthMax; i++)
{
	//returning 1 and 0 for checking
	var _imageIndex = (i > _playerHealth);
	if (i == _playerHealth + 1)
	{
		_imageIndex += (_playerHealthFrac > 0);
		_imageIndex += (_playerHealthFrac > .25);
		_imageIndex += (_playerHealthFrac > .5);
	}
	draw_sprite(sHealth, _imageIndex, 8 + ((i-1)*16), 8);
}

//Draw Coin
var _xx, _yy;

//Coin Icon
_xx = 28;
_yy = 31;
draw_sprite (sCoinUI, 0, _xx, _yy);

//Coin Text

draw_set_color(c_black);
draw_set_font (fnM5x7);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

_xx += sprite_get_width(sCoinUI) +4;
_yy = 27;

var _str = string(global.playerMoney);
draw_text(_xx +1, _yy, _str);
draw_text(_xx -1, _yy, _str);
draw_text(_xx, _yy +1, _str);
draw_text(_xx, _yy -1, _str);

draw_set_color(c_white);
draw_text(_xx, _yy, _str);

//Draw Item Box

_xx = 8;
_yy = 24;
draw_sprite (sItemUIBox, 0, _xx, _yy);
if (global.playerHasAnyItems)
{
	draw_sprite(sItemUI, global.playerEquipped,_xx, _yy)
	if (global.playerAmmo[global.playerEquipped] != -1)
	{
		draw_set_font (fnM3x6);
		draw_set_color(c_white);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_text(_xx + sprite_get_width(sItemUIBox)+1,_yy + sprite_get_height(sItemUIBox)+1, string(global.playerAmmo[global.playerEquipped]) );
	}
}

//Pause Screen
if (global.GamePaused)

{
	draw_set_color(c_black)
	draw_set_alpha(0.75)
	draw_rectangle(0,0,RESOLUTION_W,RESOLUTION_H,false)
	draw_set_alpha(1.0)
	draw_set_color(c_white)
	draw_set_font(fnM5x7)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text(window_get_width() * 0.25,window_get_height() * 0.25,"...Game Paused...");
	for(var i = 0; i < array_length(pauseOption); i++)
	{
		var _print = "";
		if (i==pauseOptionSelected)
		{
			_print +="> " + pauseOption[i] + " <"
		}
		else
		{
			_print += pauseOption[i];
			draw_set_alpha(0.7)
		}
		draw_text(RESOLUTION_W * 0.25, RESOLUTION_H * 0.25 +18 + (i *  12) , _print)
		draw_set_alpha(1.0)
	}	
}