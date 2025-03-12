// 🌩️ Background Effect (Dark Night + Lightning)
var nightColor = make_color_rgb(10, 10, 20); // Dark blue-black
draw_clear(nightColor);

// Get viewport center dynamically
var viewX = camera_get_view_x(view_camera[0]);
var viewY = camera_get_view_y(view_camera[0]);
var viewWidth = camera_get_view_width(view_camera[0]);
var viewHeight = camera_get_view_height(view_camera[0]);

var centerX = viewX + (viewWidth / 2);
var centerY = viewY + (viewHeight / 2);

// Lightning Effect
if (irandom(200) == 0) { // Random lightning flash
    draw_set_alpha(0.8);
    draw_set_color(c_white);
    draw_rectangle(viewX, viewY, viewX + viewWidth, viewY + viewHeight, false);
    draw_set_alpha(1);
}

// Button Positions (Centered Dynamically)
var button_width = 220;
var button_height = 55;
var start_y = centerY - 30; // Adjusted for centering
var exit_y = centerY + 40;  // Adjusted for spacing

// Set Font & Alignment
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_title); // Make sure you have a font named "fnt_title"

// 🔹 Draw Title with Subtle Glow Effect
draw_set_color(c_black);
draw_text(centerX + 2, centerY - 100, "Coven Reminiscence");
draw_set_color(c_white);
draw_text(centerX, centerY - 102, "Coven Reminiscence");

// 🔹 Function to Draw Buttons with Glowing Effect
function draw_rounded_button(x1, y1, x2, y2, selected) {
    if (selected) {
        draw_set_color(make_color_rgb(160, 32, 240)); // Purple glow
        draw_roundrect(x1 - 4, y1 - 4, x2 + 4, y2 + 4, 15); // Outer glow effect
    } else {
        draw_set_color(make_color_rgb(60, 60, 60)); // Dark Gray
    }
    draw_roundrect(x1, y1, x2, y2, 15);
}

// 🔹 Draw Buttons with Selection Highlight (Centered)
draw_rounded_button(centerX - button_width / 2, start_y, centerX + button_width / 2, start_y + button_height, selectedOption == 0);
draw_rounded_button(centerX - button_width / 2, exit_y, centerX + button_width / 2, exit_y + button_height, selectedOption == 1);

// 🔹 Draw Button Text with Purple Highlight on Selection
draw_set_color(selectedOption == 0 ? make_color_rgb(160, 32, 240) : c_white);
draw_text(centerX, start_y + button_height / 2, "Start Game");

draw_set_color(selectedOption == 1 ? make_color_rgb(160, 32, 240) : c_white);
draw_text(centerX, exit_y + button_height / 2, "Exit Game");

