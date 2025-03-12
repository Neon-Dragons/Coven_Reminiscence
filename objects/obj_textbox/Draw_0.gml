var accept_key = keyboard_check_pressed(org("0"));

var textbox_x = camera_get_view_x(view_camera[0]);
var textbox_y = camera_get_view_y(view_camera[0]) + 144;

if setup == false {
	
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	page_number = array_length(text);
	for (var i = 0; i < page_number; i++) {
		text_length[i] = string_length(text[i]);
		
		text_s_offset[i] = 50;
	}
	
}

if (draw_char < text_length[page]) {
	draw_char += text_speed;
	draw_char = clamp(draw_char, 0, text_length[page]);
}

//skip dialogue
if accept_key {
	if (draw_char == text_length[page]) {
		
		if page < page_number -1 {
			page++;
			draw_char = 0;
		}
		
		else {
			instance_destroy();
		}
	}
	else {
		draw_char = text_length[page];
	}
}