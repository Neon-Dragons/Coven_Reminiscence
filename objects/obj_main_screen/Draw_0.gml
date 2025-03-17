// Get view properties
var viewX = camera_get_view_x(view_camera[0]);
var viewY = camera_get_view_y(view_camera[0]);
var viewWidth = camera_get_view_width(view_camera[0]);
var viewHeight = camera_get_view_height(view_camera[0]);

// Draw the background sprite stretched to fit the view
draw_sprite_stretched(spr_main_screen, 0, viewX, viewY, viewWidth, viewHeight);

// Optional: Lightning effect
if (irandom(200) == 0) {
    draw_set_alpha(0.8);
    draw_set_color(c_white);
    draw_rectangle(viewX, viewY, viewX + viewWidth, viewY + viewHeight, false);
    draw_set_alpha(1);
}

// Optional fade overlay for transitions
if (fade_in) {
    draw_set_alpha(fade_alpha);
    draw_set_color(c_black);
    draw_rectangle(viewX, viewY, viewX + viewWidth, viewY + viewHeight, false);
    draw_set_alpha(1);
}
