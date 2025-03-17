var gamepad = global.gamepad_main;
var button_next = 0;

if (gamepad != undefined) {
    button_next += gamepad_button_check_released(gamepad, gp_face1);
}

if (!showing_dialog) {

    if (dialog.count() <= 0) {
        instance_destroy();
        obj_player.inTrigger = false;

        // Only unpause when dialogue ends
        global.game_paused = false;

        if (obj_player.completedLevel) {
            global.game_over = true;
        }

        return;
    }

    // Pause the game when dialogue starts
    global.game_paused = true;

    current_dialog = dialog.pop();

    if (current_dialog != undefined) {
        showing_dialog = true;
        alpha = 0; // Reset alpha for fade-in
    }

} else {

    // Fade alpha in smoothly
    alpha = lerp(alpha, 1, 0.2);

    if (keyboard_check_released(key_next) || button_next) {
        showing_dialog = false;
        alpha = 0;
    }
}
