// Scroll the credits text up
credits_y_position -= scroll_speed;

// If the credits text has fully scrolled off the screen, transition to the main menu or next room
if (credits_y_position < -string_height(credits_text)) {
    // Go to the next room after credits (main menu, for example)
    room_goto(rm_main_screen); // Replace `rm_main_menu` with the desired room
}

