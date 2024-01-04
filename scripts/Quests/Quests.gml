// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#region HAT CAT
function ActivateHatCat()
{
	var _hasHat = (global.iLifted != noone) && (global.iLifted.object_index == oHat);
	switch (global.questStatus[? "TheHatQuest"])
	{
		case 0: //not started
		{
			//player might have brought the hat back anyway

			if (_hasHat)
			{
				//complete quest
				NewTextBox("Wait, you're holding my hat! Can I get that back?", 2);
				with (oHat) instance_destroy();
				global.iLifted = noone;
				with (oPlayer) spriteWalk = sPlayerWalk;
				NewTextBox("Thanks! You're quite the kind person!", 2);
				global.questStatus[? "TheHatQuest"] = 2;
				with (oNPCOne) sprite_index = sNPCOneHat;
			}
			else
			{
				//offer quest
				NewTextBox("Hello there! You look like a nice individual, cape and all!", 2);
				NewTextBox("Could you find my missing hat?", 2, ["4:Sure thing!", "5:Maybe not right now..."]);
			}

			

		}
		break;		
		case 1: //quest in progress
		{
			if (_hasHat)
			{
				//complete quest
				NewTextBox("Oh you found my hat! Can I have it?", 2);
				with (oHat) instance_destroy();
				global.iLifted = noone;
				with (oPlayer) spriteWalk = sPlayerWalk;
				NewTextBox("Thanks! You're quite the kind person!", 2);
				global.questStatus[? "TheHatQuest"] = 2;
				with (oNPCOne) sprite_index = sNPCOneHat;
			}
			else
			{
				//clue reminder
				NewTextBox("The hat should be inside that scary cave over the west.", 2);
				NewTextBox("You might want to equip yourself before entering!", 2);
			}			
		}
		break;
		
		case 2: //quest already completed
		{			
			NewTextBox("Thanks for finding my hat!", 2)
		}
		break;
	}
}


#endregion