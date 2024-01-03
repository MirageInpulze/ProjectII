/// @description Insert description here
// You can write your code in this editor
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





