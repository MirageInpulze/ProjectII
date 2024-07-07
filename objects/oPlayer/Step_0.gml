_inputH = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")));
_inputV = (keyboard_check(vk_down) || keyboard_check(ord("S"))) - (keyboard_check(vk_up) || keyboard_check(ord("W")));
_inputD = point_direction(0,0,_inputH,_inputV);
_inputM = point_distance(0,0,_inputH,_inputV);
keyActivate = keyboard_check_pressed(vk_space);
keyRoll = keyboard_check_pressed(vk_shift);
keyAttack = mouse_check_button_pressed(mb_left);
keyItem = mouse_check_button_pressed(mb_right);
keyItemSelectUp = mouse_wheel_up();
keyItemSelectDown = mouse_wheel_down();

if (!global.GamePaused) 
{
	script_execute(state);
	invulnerable = max (invulnerable -1, 0);
	flash = max(flash-.05, 0);
}
depth = -bbox_bottom

