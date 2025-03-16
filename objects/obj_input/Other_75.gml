var gamepad = async_load[? "pad_index"];

switch (async_load[? "event_type"]) {
	
	case "gamepad discovered":
		array_push(global.gamepads, gamepad);
		gamepad_set_axis_deadzone(gamepad, 0.2);
	break;
	
	case "gamepad lost":
		var array_index = array_get_index(global.gamepads, gamepad);
		if (array_index >= 0) {
			array_delete(global.gamepads, array_index, 1);	
		}
	break;
	
}

if array_length(global.gamepads) > 0
{
	global.gamepad_main = global.gamepads[0];
}
else
{
	global.gamepad_main = undefined;
}