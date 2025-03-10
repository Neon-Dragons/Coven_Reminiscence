
if (global.game_over) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    //draw_set_font(fnt_game_over); // Optional: Use a clear font
    draw_text(room_width / 2, room_height / 2 - 20, "GAME OVER");
    draw_text(room_width / 2, room_height / 2 + 10, "Press 'R' to Restart");
	draw_text(room_width / 2, room_height / 2 + 30, "Press 'Select' to Restart");
}
