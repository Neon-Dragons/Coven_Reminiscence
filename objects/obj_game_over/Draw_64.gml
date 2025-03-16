var viewportWidth = 1296;
var viewportHeight = 972;

// === GAME OVER SCREEN ===
if (global.game_over) {
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, viewportWidth, viewportHeight, false);
    draw_set_alpha(1);

    var centerX = viewportWidth / 2;
    var centerY = viewportHeight / 2;

    draw_set_halign(fa_center);
    draw_set_color(c_white);

    // Title (Game Over or Victory)
    var gameOverTitle = obj_player.completedLevel ? "Victory!!" : "GAME OVER";
    draw_text(centerX, centerY - 60, gameOverTitle);

    // Game Over Menu Options
    var gameOverOptions = [
        "Restart from Last Checkpoint",
        "Restart Level",
        "Return to Main Menu",
        "Exit"
    ];
    var lineOffset = 30;

    // Draw options and highlight selected option
    for (var i = 0; i < array_length(gameOverOptions); i++) {
        if (i == global.gameover_selected_option) {
            draw_set_color(c_yellow); // Highlight the selected option
            draw_text(centerX - 10, centerY - 10 + (i * lineOffset), "> " + gameOverOptions[i]);
        } else {
            draw_set_color(c_white);
            draw_text(centerX, centerY - 10 + (i * lineOffset), gameOverOptions[i]);
        }
    }
}

// === PAUSE SCREEN WITH MENU NAVIGATION ===
if (global.game_paused && !obj_player.inTrigger) {
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, viewportWidth, viewportHeight, false);
    draw_set_alpha(1);

    var centerX = viewportWidth / 2;
    var centerY = viewportHeight / 2;

    draw_set_halign(fa_center);
    draw_set_color(c_white);

    // Pause Menu Options
    var pauseOptions = ["Resume Game", "Save Game", "Load Game", "Main Menu"];
    var lineOffset = 30;

    // Draw Title
    draw_text(centerX, centerY - 60, "PAUSED");

    // Draw options and highlight selected option
    for (var i = 0; i < array_length(pauseOptions); i++) {
        if (i == global.pause_selected_option) {
            draw_set_color(c_yellow); // Highlight the selected option
            draw_text(centerX - 10, centerY - 10 + (i * lineOffset), "> " + pauseOptions[i]);
        } else {
            draw_set_color(c_white);
            draw_text(centerX, centerY - 10 + (i * lineOffset), pauseOptions[i]);
        }
    }
}
