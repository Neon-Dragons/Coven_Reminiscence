// gamepad inputs
var gamepad = global.gamepad_main;
var upPad=0;
var downPad=0;
var aButton=0;
if (gamepad != undefined)
{
	upPad += gamepad_button_check_pressed(gamepad, gp_padu);
	downPad += gamepad_button_check_pressed(gamepad, gp_padd);
	aButton += gamepad_button_check_pressed(gamepad, gp_face1);
}


// Handle keyboard navigation (W/S and Up/Down keys)
if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")) || downPad) {
    selectedOption = (selectedOption + 1) mod 2; // Move down
}
if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || upPad) {
    selectedOption = (selectedOption - 1 + 2) mod 2; // Move up
}

// Handle selection (Enter or Space)
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || aButton) {
    if (selectedOption == 0) {
        room_goto(Room1); // Ensure this is your actual game room name
    }
    else if (selectedOption == 1) {
        game_end();
    }
}

// Handle mouse input for menu selection
var mx = device_mouse_x(0);
var my = device_mouse_y(0);
if (mouse_check_button_pressed(mb_left)) {
    var centerX = display_get_width() / 2;
    var centerY = display_get_height() / 2;

    var button_width = 220;
    var button_height = 55;
    var start_y = centerY - 60;
    var exit_y = centerY + 20;

    if (mx > centerX - button_width / 2 && mx < centerX + button_width / 2) {
        if (my > start_y && my < start_y + button_height) {
            room_goto(Room1);
        }
        else if (my > exit_y && my < exit_y + button_height) {
            game_end();
        }
    }
}
