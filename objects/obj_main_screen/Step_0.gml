// Move selection between buttons
if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_left)) {
    selectedOption = max(0, selectedOption - 1);
}

if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_right)) {
    selectedOption = min(1, selectedOption + 1);
}

// Start game with spacebar
if (keyboard_check_pressed(vk_space)) {
    if (selectedOption == 0) {
        fade_in = true; // Start fade to game
    }
}

// Exit game with ESC key
if (keyboard_check_pressed(vk_escape)) {
    if (selectedOption == 1) {
        game_end();
    }
}

// Handle fade-in transition
if (fade_in) {
    fade_alpha += 0.05;
    if (fade_alpha >= 1) {
        room_goto(Room1);  // <-- Correct room name here!
    }
}
