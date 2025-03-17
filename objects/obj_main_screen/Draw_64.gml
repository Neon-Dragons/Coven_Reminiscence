// Get GUI dimensions
var centerX = display_get_gui_width() / 2;
var centerY = display_get_gui_height() / 2;

// --- Title Text ---
draw_set_font(fnt_pentz_title);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw title (no glow, clean)
draw_set_color(make_color_rgb(244, 199, 255)); // #F4C7FF
draw_text(centerX, centerY - 100, "");

// --- Button Settings ---
var button_width = 140;
var button_height = 35;
var spacing = 15;

var start_y = centerY - (button_height / 2) - spacing;
var exit_y = centerY + (button_height / 2) + spacing;

// --- Function: Draw Rounded Buttons ---
function draw_rounded_button(x1, y1, x2, y2, selected) {
    if (selected) {
        draw_set_color(make_color_rgb(160, 32, 240)); // Hover color (Purple)
    } else {
        draw_set_color(make_color_rgb(60, 60, 60)); // Normal button color
    }
    draw_roundrect(x1, y1, x2, y2, 10); // 10 is corner radius
}

// --- Draw Start Button ---
draw_rounded_button(centerX - button_width / 2, start_y, centerX + button_width / 2, start_y + button_height, selectedOption == 0);

// --- Draw Exit Button ---
draw_rounded_button(centerX - button_width / 2, exit_y, centerX + button_width / 2, exit_y + button_height, selectedOption == 1);

// --- Button Text ---
draw_set_font(fnt_pentz_small);
draw_set_color(make_color_rgb(244, 199, 255)); // #F4C7FF (light pink-purple)

// Centered inside button
draw_text(centerX, start_y + button_height / 2, "Start Game");
draw_text(centerX, exit_y + button_height / 2, "Exit Game");

// Optional: Draw fade overlay here if you want, but it's already in Draw Event
