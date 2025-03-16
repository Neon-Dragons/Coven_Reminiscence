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


// Minimap Position
var minimap_x = view_xport[1];
var minimap_y = view_yport[1];
var minimap_w = view_wport[1];
var minimap_h = view_hport[1];

// Draw Minimap Background
draw_set_alpha(0.5); // Make it slightly transparent
draw_set_color(c_black);
draw_rectangle(minimap_x, minimap_y, minimap_x + minimap_w, minimap_y + minimap_h, false);
draw_set_alpha(1); // Reset transparency
//// Draw Player Position on Minimap
//var player_minimap_x = minimap_x + (obj_player.x / room_width) * minimap_w;
//var player_minimap_y = minimap_y + (obj_player.y / room_height) * minimap_h;

//draw_set_color(c_white); // Outer border
//draw_circle(player_minimap_x, player_minimap_y, 6, false);

//draw_set_color(c_red); // Inner dot
//draw_circle(player_minimap_x, player_minimap_y, 4, false);
draw_set_color(c_white);
draw_rectangle(minimap_x, minimap_y, minimap_x + minimap_w, minimap_y + minimap_h, true);
