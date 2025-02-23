var move_left = keyboard_check(ord("A"))
var move_right = keyboard_check(ord("D"))
var move_up = keyboard_check(ord("W"))
var move_down = keyboard_check(ord("S"))
var joyStickLeftX = 0;
var joyStickLeftY = 0;

var gamepad = global.gamepad_main;
if (gamepad != undefined)
{
	move_left += gamepad_button_check(gamepad, gp_padl);
	move_right += gamepad_button_check(gamepad, gp_padr);
	move_up += gamepad_button_check(gamepad, gp_padu);
	move_down += gamepad_button_check(gamepad, gp_padd);
	joyStickLeftX = gamepad_axis_value(gamepad, gp_axislh);
	joyStickLeftY = gamepad_axis_value(gamepad, gp_axislv);
}

var xSpeed = (move_right - move_left) * moveSpeed;
var ySpeed = (move_down - move_up) * moveSpeed;

x += xSpeed;
y += ySpeed;


if joyStickLeftX != 0
{
	x += moveSpeed * joyStickLeftX;
}
if joyStickLeftY != 0
{
	y += moveSpeed * joyStickLeftY;
}