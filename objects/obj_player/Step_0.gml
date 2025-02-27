
/////////////////Player Input///////////////
var move_left = keyboard_check(ord("A"))
var move_right = keyboard_check(ord("D"))
var move_up = keyboard_check(ord("W"))
var move_down = keyboard_check(ord("S"))
var walking = keyboard_check_pressed(vk_shift)
var stopWalking = keyboard_check_released(vk_shift)
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
	walking += gamepad_button_check_pressed(gamepad, gp_face2)
	stopWalking += gamepad_button_check_released(gamepad, gp_face2)
}

xSpeed = (move_right - move_left)
ySpeed = (move_down - move_up)

if joyStickLeftX != 0
{
	xSpeed = joyStickLeftX;
}
if joyStickLeftY != 0
{
	ySpeed = joyStickLeftY;
}
xSpeed = clamp(xSpeed, -1, 1);
ySpeed = clamp(ySpeed, -1, 1);
xSpeed = xSpeed * moveSpeed;
ySpeed = ySpeed * moveSpeed;
///////collisions////////////////
if (place_meeting(x + xSpeed, y, obj_wall) == true) {
	xSpeed= 0;
}
if (place_meeting(x, y + ySpeed, obj_wall) == true) {
	ySpeed= 0;
}
if (place_meeting(x + xSpeed, y, obj_caucus) == true) {
	xSpeed= 0;
}
if (place_meeting(x, y + ySpeed, obj_caucus) == true) {
	ySpeed= 0;
}
x += xSpeed;
y += ySpeed;

//Sprites
if ySpeed == 0
{
	if xSpeed > 0
	{
		currentFacing = CharacterFacing.Right;
		sprite_index = spr_player_right
	}
	if xSpeed < 0 {
		currentFacing = CharacterFacing.Left;
		sprite_index = spr_player_left
	}	
}

if xSpeed == 0 {
	if ySpeed > 0 {
		currentFacing = CharacterFacing.Down;
		sprite_index = spr_player_down
	}
	if ySpeed < 0 {
		currentFacing = CharacterFacing.Up;
		sprite_index = spr_player_up

	}	
}

	

///Running
if walking {
	currentState = MovementState.Walking;
	moveSpeed = 1.5;
}
if stopWalking {
	moveSpeed = 3;
	currentState = MovementState.Running;
}