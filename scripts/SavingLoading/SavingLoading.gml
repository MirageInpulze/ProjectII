// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SaveGame()
{
	var _map = ds_map_create();
	_map[? "room"] = room;
	_map[? "playerHealth"] = global.playerHealth;
	_map[? "playerHealthMax"] = global.playerHealthMax;
	_map[? "playerMoney"] = global.playerMoney;
	_map[? "playerItemUnlocked"] = global.playerItemUnlocked;
	_map[? "playerAmmo"] = global.playerAmmo;
	_map[? "playerEquipped"] = global.playerEquipped;
	_map[? "playerHasAnyItems"] = global.playerHasAnyItems;
	_map[? "targetX"] = global.targetX;
	_map[? "targetY"] = global.targetY;
	
	var _questMap = ds_map_create();
	ds_map_copy(_questMap, global.questStatus);
	ds_map_add_map(_map, "questStatus", _questMap);
	
	//Save all this mess to string
	var _string = json_encode(_map);
	SaveStringToFile("save" + string(global.gameSaveSlot) + ".mzk", _string);
	//Terminal Debugging
	show_debug_message(_string);
	
	//Nuke Data
	ds_map_destroy(_map);
	show_debug_message("Game Saved!");
}



function SaveStringToFile(_filename, _string)
{
	//Cross-Platform Savefile Shennanigans. Not Necessary
	var _buffer = buffer_create(string_byte_length(_string)+1,buffer_fixed,1);
	buffer_write(_buffer,buffer_string,_string);
	buffer_save(_buffer,_filename);
	buffer_delete(_buffer);
}

function LoadGame(_slot)
{
	global.gameSaveSlot = _slot;
	var _file = "save" + string(global.gameSaveSlot) + ".mzk";
	if (file_exists(_file))
	{
		//Load game data
		var _json = LoadJSONFromFile(_file);
		//Global Variable
		global.playerHealth = _json[? "playerHealth"];
		global.playerHealthMax = _json[? "playerHealthMax"];
		global.playerMoney = _json[? "playerMoney"];
		global.playerItemUnlocked = _json[? "playerItemUnlocked"];
		global.playerAmmo = _json[? "playerAmmo"];
		global.playerEquipped = _json[? "playerEquipped"];
		global.playerHasAnyItems = _json[? "playerHasAnyItems"];
		global.targetX = _json[? "targetX"];
		global.targetY = _json[? "targetY"]; 
		
		//list to arrays
		for (var i = 0 ; i < item.TYPE_COUNT; i++)
		{
			global.playerItemUnlocked[i] = _json[? "playerItemUnlocked"][| i];
			global.playerAmmo[i] = _json[? "playerAmmo"][| i];
		}
		//Questdata
		ds_map_copy(global.questStatus, _json[? "questStatus"]);
		room_goto(_json[? "room"]);
		ds_map_destroy(_json);
		return true;
	}
	else 
	{
		show_debug_message("No save existent")
		return false;
	}
}


function LoadJSONFromFile(_filename)
{
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _json = json_decode(_string);
	return _json;
}

