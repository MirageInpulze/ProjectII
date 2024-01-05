/// @description Insert description here
// You can write your code in this editor

if (position_meeting(oPlayer.x, oPlayer.y, id))
{
	image_alpha = max(image_alpha - .04, .25);
}
else
{
	image_alpha = max(image_alpha + .04, 1.00);
}




