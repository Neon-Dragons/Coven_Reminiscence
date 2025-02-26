
/////////////////Player Input///////////////
var move_left = keyboard_check(ord("A"))
var move_right = keyboard_check(ord("D"))
var move_up = keyboard_check(ord("W"))
var move_down = keyboard_check(ord("S"))
var sprint = keyboard_check_pressed(vk_shift)
var stopSprint = keyboard_check_released(vk_shift)
move_up += keyboard_check(vk_up)
move_down += keyboard_check(vk_down)
move_left += keyboard_check(vk_left)
move_right += keyboard_check(vk_right)

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
	sprint += gamepad_button_check_pressed(gamepad, gp_face2)
	stopSprint += gamepad_button_check_released(gamepad, gp_face2)
}

xSpeed = (move_right - move_left) * moveSpeed;
ySpeed = (move_down - move_up) * moveSpeed;
if joyStickLeftX != 0
{
	xSpeed = moveSpeed * joyStickLeftX;
}
if joyStickLeftY != 0
{
	ySpeed = moveSpeed * joyStickLeftY;
}

///////collisions////////////////
if (place_meeting(x + xSpeed, y, obj_wall) == true) {
	xSpeed= 0;
}
if (place_meeting(x, y + ySpeed, obj_wall) == true) {
	ySpeed= 0;
}
x += xSpeed;
y += ySpeed;

///Running
if sprint {
	moveSpeed = 3;
}
if stopSprint {
	moveSpeed = 1.5;
}

