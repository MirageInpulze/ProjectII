/// @description Insert description here
// You can write your code in this editor
if (!keyPressed)
{
	titleVisible = min(1, titleVisible + .01)

}
else
{
	titleVisible = max (0, titleVisible - .01);
	slotsVisible = min (1, slotsVisible + .01)
}


if (keyboard_check_pressed(vk_up))
{
	slotsSelected -= 1;
	if (slotsSelected < 0) slotsSelected = 2;
}

if (keyboard_check_pressed(vk_down))
{
	slotsSelected -= 1;
	if (slotsSelected > 2) slotsSelected = 0;
}

if (keyboard_check_pressed(vk_space))
{
	global.gameSaveSlot = slotsSelected;
	if (!LoadGame(global.gameSaveSlot));
	{
		room_goto(rVillage);
	}
	loadingStarted = true;
}





if (keyboard_check_pressed(vk_anykey)) keyPressed = true;


// Delete Save File

if (keyboard_check_pressed(vk_backspace)){
	slotsData[slotsSelected] = -1;
	if (file_exists("save" + string(slotsSelected) + ".mzk")){
		file_delete("save" + string(slotsSelected) + ".mzk");
	}
}
