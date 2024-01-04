#macro TILE_SIZE 16
#macro RESOLUTION_W 640
#macro RESOLUTION_H 360
#macro FRAME_RATE 60
#macro CARDINAL_DIR round(direction/90)
#macro ROOM_START rVillage

enum enemystate
{
	idle,
	wander,
	chase,
	attack,
	hurt,
	die,
	wait
}

enum item
{
	none,
	bomb,
	bow,
	hook,
	TYPE_COUNT
}