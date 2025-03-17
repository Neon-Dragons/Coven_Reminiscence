if (showing_dialog == true) {

    var text_x = 50;
    var text_y = 50;

    var padding = 20;
    var box_width = 600;
    var box_height = 120;

    // === Draw the Box ===

    // Outer border
    draw_set_alpha(alpha);
    draw_set_color(c_black);
    draw_rectangle(text_x - 10, text_y - 10, text_x + box_width + 10, text_y + box_height + 10, false);

    // Inner background
    draw_set_color(make_color_rgb(44, 30, 106)); // Dark purple-blue
    draw_rectangle(text_x, text_y, text_x + box_width, text_y + box_height, false);

    // === Set Font + Text Color ===
    draw_set_font(fnt_pentz_small); // ✅ This is the custom font you wanted!
    draw_set_color(make_color_rgb(244, 199, 255)); // Light purple (hex #F4C7FF)

    // === Text Alignment ===
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    // === Draw the Dialogue Message ===
    if (current_dialog != undefined && current_dialog.message != undefined) {
        draw_text_ext(
            text_x + padding,
            text_y + padding,
            current_dialog.message,
            16,
            box_width - padding * 2
        );
    }

    draw_set_alpha(1); // Reset alpha
}
