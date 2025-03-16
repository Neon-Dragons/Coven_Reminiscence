// === DISPLAY ON-SCREEN MESSAGE ===
if (global.saved_message_timer > 0) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_title); // Ensure you have a font assigned
    draw_set_color(c_white);

    var messageX = camera_get_view_width(view_camera[0]) / 2;
    var messageY = camera_get_view_height(view_camera[0]) - 100; // Position above bottom HUD

    draw_text(messageX, messageY, global.saved_message);

    global.saved_message_timer -= 1; // Reduce timer each frame
}


// === DISPLAY ON-SCREEN MESSAGE ===
if (global.loaded_message_timer > 0) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_title); // Ensure you have a font assigned
    draw_set_color(c_white);

    var messageX = camera_get_view_width(view_camera[0]) / 2;
    var messageY = camera_get_view_height(view_camera[0]) - 100; // Position above bottom HUD

    draw_text(messageX, messageY, global.loaded_message);

    global.loaded_message_timer -= 1; // Reduce timer each frame
}
