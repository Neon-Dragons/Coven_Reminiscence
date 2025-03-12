// If the game is over, display the Game Over screen
if (global.game_over) {
    // Dark overlay background for better visibility
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);

    // Center position
    var centerX = room_width / 2;
    var centerY = room_height / 2;

    // Set font & alignment
    draw_set_halign(fa_center);
    draw_set_color(c_white); // Ensure text is always white

    // Game Over Text
    draw_text(centerX, centerY - 50, "GAME OVER");

    // Instructions for Restart, Main Menu, and Exit
    draw_text(centerX, centerY - 10, "Press 'R' or Select to Restart");
    draw_text(centerX, centerY + 10, "Press 'M' or LB for Main Menu");
    draw_text(centerX, centerY + 30, "Press 'E' or RB to Exit");
}

// If the game is paused, show the pause screen
if (global.game_paused) {
    // Dark overlay effect
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_alpha(1);

    // Pause Screen Text
    var centerX = room_width / 2;
    var centerY = room_height / 2;
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(centerX, centerY - 20, "PAUSED");
    draw_text(centerX, centerY + 20, "Press 'Escape' or Start to Resume");
}
