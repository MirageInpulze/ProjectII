/// @description Insert description here
// You can write your code in this editor
if (instance_exists(oPlayer)) && (position_meeting(oPlayer.x, oPlayer.y, id)) && (oPlayer.state != PlayerDead)
{
	global.targetRoom = targetRoom;
	global.targetX = targetX;
	global.targetY = targetY;
	global.targetDirection = oPlayer.direction;
	room_goto(targetRoom);
	//instance_destroy();

}




