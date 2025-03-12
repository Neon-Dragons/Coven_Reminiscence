

// CHECK IF PLAYER IS DEAD
if (playerHealth <= 0) {
    global.game_over = true;
}


/////////////////Player Input///////////////
var move_left = keyboard_check(ord("A"))
var move_right = keyboard_check(ord("D"))
var move_up = keyboard_check(ord("W"))
var move_down = keyboard_check(ord("S"))
var lightningSpell = keyboard_check_pressed(ord("Q"))
var darkMagicSpell = keyboard_check_pressed(ord("E"));
var fireballSpell = keyboard_check_pressed(vk_space)
var walking = keyboard_check_pressed(vk_shift)
var stopWalking = keyboard_check_released(vk_shift)
var useSage = keyboard_check_pressed(ord("1"))
var usePotion = keyboard_check_pressed(ord("2"))
var pauseGame = keyboard_check_pressed(vk_escape)
var restartGame = keyboard_check_pressed(ord("R"))
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
	fireballSpell += gamepad_button_check_pressed(gamepad, gp_face3);
	darkMagicSpell += gamepad_button_check_pressed(gamepad, gp_face1);
	lightningSpell += gamepad_button_check_pressed(gamepad, gp_face4);
	joyStickLeftX = gamepad_axis_value(gamepad, gp_axislh);
	joyStickLeftY = gamepad_axis_value(gamepad, gp_axislv);
	walking += gamepad_button_check_pressed(gamepad, gp_face2);
	stopWalking += gamepad_button_check_released(gamepad, gp_face2);
	useSage += gamepad_button_check_pressed(gamepad, gp_shoulderl);
	usePotion += gamepad_button_check_pressed(gamepad, gp_shoulderr);
	pauseGame += gamepad_button_check_pressed(gamepad, gp_start);
	restartGame += gamepad_button_check_pressed(gamepad, gp_select);
}

// PAUSE GAME SYSTEM
if (pauseGame) {
    global.game_paused = !global.game_paused; // Toggle pause state
}
// STOP PLAYER MOVEMENT WHEN GAME IS PAUSED
if (global.game_paused) {
    exit; // Stops player movement if the game is paused
}

// STOP ALL MOVEMENT IF GAME IS OVER
if (global.game_over) {
    if (restartGame) {
        show_debug_message("Restarting game...");
        room_restart(); // Restart room
        global.game_over = false;
    }
	    // Return to Main Menu
    if (keyboard_check_pressed(ord("M")) || useSage) {
        show_debug_message("Returning to Main Menu...");
        room_goto(rm_main_screen); // Ensure `rm_main_screen` exists
        global.game_over = false;
    }

	    // Exit Game
    if (keyboard_check_pressed(ord("E")) || usePotion) {
        show_debug_message("Exiting game...");
        game_end();
    }
    exit; // Prevents further movement/actions
	
	
}

//Using Items
if (useSage) {
	var lostHealth = playerHealthMax - playerHealth
	if (sages > 0 && lostHealth >= 5) {
		audio_play_sound(snd_sage,1,false);
		playerHealth += clamp(10, 10, lostHealth);
		sages -= 1;
	}
}

if (usePotion) {
	var lostHealth = playerHealthMax - playerHealth
	if (potions > 0 && lostHealth >= 5) {
		audio_play_sound(snd_potion,1,false);
		playerHealth += clamp(5, 5, lostHealth);
		potions -= 1;
	}
}
xSpeed = (move_right - move_left)
ySpeed = (move_down - move_up)

///Walking
if walking {
	currentState = MovementState.Walking;
	moveSpeed = 1.5;
}
	
if stopWalking {
	currentState = MovementState.Running;
	moveSpeed = 3;
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
		sprite_index = spr_player_right
		facingAngle = 0;
	}
	if xSpeed < 0 {
		sprite_index = spr_player_left
		facingAngle = 180;
	}	
}

if xSpeed == 0 {
	if ySpeed > 0 {
		sprite_index = spr_player_down
		facingAngle = 270;
	}
	if ySpeed < 0 {
		sprite_index = spr_player_up
		facingAngle = 90;

	}	
}

	




//Spell Attacks
if (level >= 2 && lightningSpell && mana >= 20) { 
		instance_create_layer(x ,y,"Instances", obj_lightning_spell);
			audio_play_sound(snd_lightning_spell,1,false);
			mana -= 20;	
	

}

if (level >= 3 && darkMagicSpell && mana >= 50) { 
		instance_create_layer(x ,y,"Instances", obj_dark_magic_spell_radius);
		mana -= mana;	
	

}

if (level >= 1 && fireballSpell && mana >= 10) {
	instance_create_layer(x, y, "Instances", obj_fireball_spell);
	audio_play_sound(snd_fireball_spell,1,false);
	mana -= 10;
}

if (mana != manaMax) {
	mana += 0.05
}
