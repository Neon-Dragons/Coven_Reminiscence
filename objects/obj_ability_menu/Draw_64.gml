// Get GUI height so we can calculate bottom-left Y position
var gui_height = display_get_gui_height();

// Positioning
var box_x = menu_x_offset;  // 20px from the left
var box_y = gui_height - (base_height + (array_length(abilities_list) * line_height)) - menu_y_offset;

// Box dimensions
var box_width = menu_width;
var box_height = base_height + (array_length(abilities_list) * line_height);

// === Draw the box background ===
draw_set_color(c_white);
draw_rectangle(box_x - 2, box_y - 2, box_x + box_width + 2, box_y + box_height + 2, false);

draw_set_color(make_color_rgb(44, 30, 106)); // Dark background
draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);

// === Set the font ===
draw_set_font(fnt_pentz_small);

// === Draw the title ===
draw_set_color(make_color_rgb(244, 199, 255)); // Light purple
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(box_x + 10, box_y + 5, "Abilities");

// === Draw each unlocked ability ===
var text_y = box_y + base_height;
for (var i = 0; i < array_length(abilities_list); i++) {
    if (abilities_unlocked[i] == 1) {
        var ability_text = "[" + abilities_commands[i] + "] " + abilities_list[i];
        draw_text(box_x + 10, text_y, ability_text);
        text_y += line_height;
    }
}
