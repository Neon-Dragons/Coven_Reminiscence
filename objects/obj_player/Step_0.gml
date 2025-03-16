

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
stopWalking = keyboard_check_released(vk_shift)
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

// If Escape is pressed, toggle the pause menu
if (pauseGame) {
    if (!global.show_pause_menu) { 
        // Open the menu and pause the game
        global.game_paused = true;
        global.show_pause_menu = true;
        global.selected_option = 0;
    } else {
        // Close the pause menu and resume the game
        global.show_pause_menu = false;
        global.game_paused = false;
    }
}

// STOP PLAYER MOVEMENT WHEN PAUSED (but allow menu navigation)
if (global.game_paused && !global.show_pause_menu) {
    exit; // Stops player movement but allows menu navigation
}

// === PAUSE MENU NAVIGATION (Only When Menu is Open) ===
if (global.show_pause_menu) {
    if (keyboard_check_pressed(vk_down)) {
        global.pause_selected_option = (global.pause_selected_option + 1) mod 4;
    }
    if (keyboard_check_pressed(vk_up)) {
        global.pause_selected_option = (global.pause_selected_option + 3) mod 4; // Wrap-around navigation
    }

    if (keyboard_check_pressed(vk_enter)) {
        if (global.pause_selected_option == 0) { // Resume Game
            global.show_pause_menu = false;
            global.game_paused = false;
        }
        if (global.pause_selected_option == 1) { // Save Game
            save_game();
        }
        if (global.pause_selected_option == 2) { // Load Game
            load_game();
        }
        if (global.pause_selected_option == 3) { // Return to Main Menu
            room_goto(rm_main_screen);
            global.show_pause_menu = false;
            global.game_paused = false;
        }
    }
}

// STOP PLAYER MOVEMENT WHEN GAME IS PAUSED
if (global.game_paused) {
    exit; // Stops player movement if the game is paused
}

// STOP ALL MOVEMENT IF GAME IS OVER
// STOP ALL MOVEMENT IF GAME IS OVER
if (global.game_over) {
    // Disable player movement & actions completely
 

    // Move up in menu
    if (keyboard_check_pressed(vk_up)) {
        global.gameover_selected_option = (global.gameover_selected_option - 1 + 4) mod 4; 
    }

    // Move down in menu
    if (keyboard_check_pressed(vk_down)) {
        global.gameover_selected_option = (global.gameover_selected_option + 1) mod 4;
    }

    // Confirm selection
    if (keyboard_check_pressed(vk_enter)) {
        switch (global.gameover_selected_option) {
            case 0: // Restart from Last Checkpoint
                show_debug_message("Restarting from Last Checkpoint...");
                load_game();
                global.game_over = false;
                break;
                
            case 1: // Restart Level
                show_debug_message("Restarting game...");
                room_restart();
                global.game_over = false;
                break;
                
            case 2: // Return to Main Menu
                show_debug_message("Returning to Main Menu...");
                room_goto(rm_main_screen); // Ensure `rm_main_screen` exists
                global.game_over = false;
                break;
                
            case 3: // Exit Game
                show_debug_message("Exiting game...");
                game_end();
                break;
        }
    }
	   exit; // Ensures nothing else in this event runs
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

//Sprites
mask_index = spr_player_down;
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

// cheats :3
if (keyboard_check_pressed(ord("L"))) { 
    level = 3; 
    mana = manaMax;
    playerHealth = playerHealthMax;
}


if (keyboard_check_pressed(ord("P"))) {
    var targetObject = obj_tree_willow;  
    var targetX = targetObject.x;
    var targetY = targetObject.y;
    
    x = targetX - -60; 
    y = targetY - -60;

}


if (keyboard_check_pressed(ord("U"))) {
    potions = 999;  
	sages = 999;
}
function save_game() {
    ini_open("savefile.ini");

    // Player stats
    ini_write_real("Player", "x", x);
    ini_write_real("Player", "y", y);
    ini_write_real("Player", "health", playerHealth);
    ini_write_real("Player", "mana", mana);
    ini_write_real("Player", "potions", potions);
    ini_write_real("Player", "sages", sages);
    ini_write_real("Player", "level", level);
    
    // Player state
    ini_write_real("Player", "facingAngle", facingAngle);
    ini_write_string("Player", "currentState", string(currentState));
    ini_write_real("Player", "moveSpeed", moveSpeed);

    // Game state
    ini_write_string("Game", "room", room_get_name(room));
    ini_write_real("Game", "game_over", global.game_over);
    ini_write_real("Game", "game_paused", global.game_paused);
    ini_write_real("Game", "show_pause_menu", global.show_pause_menu);
    ini_write_real("Game", "selected_option", global.pause_selected_option);

    ini_close();


    global.save_exists = true;
    global.saved_message = "Game Saved!";
    global.saved_message_timer = 30; // Show for 2 seconds


    show_debug_message("Game Saved Successfully!");

    // Exit pause menu and resume game after saving
    global.show_pause_menu = false;
    global.game_paused = false;
}


function load_game() {
    if (file_exists("savefile.ini")) {
        ini_open("savefile.ini");

        // Player stats
        x = ini_read_real("Player", "x", x);
        y = ini_read_real("Player", "y", y);
        playerHealth = ini_read_real("Player", "health", playerHealth);
        mana = ini_read_real("Player", "mana", mana);
        potions = ini_read_real("Player", "potions", potions);
        sages = ini_read_real("Player", "sages", sages);
        level = ini_read_real("Player", "level", level);
        
        // Player state
        facingAngle = ini_read_real("Player", "facingAngle", facingAngle);
        var loadedState = ini_read_string("Player", "currentState", string(MovementState.Running));
        currentState = loadedState == "Walking" ? MovementState.Walking : MovementState.Running;
        moveSpeed = ini_read_real("Player", "moveSpeed", moveSpeed);

        // Game state
        var saved_room = ini_read_string("Game", "room", room_get_name(room));

        // Ensure game is not paused or in game over after loading
        global.game_over = false;
        global.game_paused = false;
        global.show_pause_menu = false;
        global.selected_option = 0; // Reset menu selection

        ini_close();

        if (saved_room != room_get_name(room)) {
            room_goto(asset_get_index(saved_room));
        }

        global.loaded_message = "Game Loaded!";
        global.loaded_message_timer = 30;
        show_debug_message("Game Loaded Successfully!");
		        // ✅ NEW: Prevent auto-save for 3 seconds after loading
        global.just_loaded = true;
        global.just_loaded_timer = 180; // 3 seconds (60 frames per second)
    } else {
        show_debug_message("No Save File Found!");
        global.loaded_message_timer = "No Save Data!";
        global.loaded_message_timer = 30;
    }
}

if (playerHealth < previousHealth) { // If HP dropped, trigger damage effect
    global.recentlyDamaged = true;
    global.damageTimer = current_time + 1000; // Effect lasts 1 second

    show_debug_message("Player took damage! Shader activated.");
}
// ✅ Decrease the just loaded timer
if (global.just_loaded_timer > 0) {
    global.just_loaded_timer -= 1;
} else {
    global.just_loaded = false; // ✅ Allow auto-save again
}
// Ensure the minimap camera shows the entire room
camera_set_view_pos(view_camera[1], 0, 0);
