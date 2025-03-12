var gamepad = global.gamepad_main;
var button_next = 0;
if (gamepad != undefined)
{
	button_next += gamepad_button_check_released(gamepad, gp_face1);
}

if (showing_dialog == false) {
	if (dialog.count() <= 0) {
		instance_destroy();
		obj_player.inTrigger = false;
		global.game_paused = !global.game_paused;
		if (obj_player.completedLevel)
			global.game_over = true;
		return;
	}
	
	current_dialog = dialog.pop();
	showing_dialog = true;
} else {
	if (keyboard_check_released(key_next) || button_next) {
		showing_dialog = false;
		alpha = 0;
	}
}