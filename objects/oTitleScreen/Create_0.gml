/// @description Insert description here
// You can write your code in this editor

titleVisible = 0.0
keyPressed = false;
slotsVisible = 0.0;
slotsSelected = 0;
loadingStarted = false;

for (var _slot = 0; _slot <= 2; _slot++)
{
	var _filename = "save" + string(_slot) + ".mzk";
	if (file_exists(_filename))
	{
		slotsData[_slot] = LoadJSONFromFile(_filename);
	}
	else slotsData[_slot] = -1;
	
	
}


