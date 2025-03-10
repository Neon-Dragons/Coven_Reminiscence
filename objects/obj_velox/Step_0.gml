// STOP ALL MOVEMENT IF GAME IS PAUSED OR GAME OVER
if (global.game_over || global.game_paused) {
    hspeed = 0;
    vspeed = 0;
    exit;
}

// HOSTILE VELOX BEHAVIOR (MOVES TOWARD PLAYER + SHOOTS)
if (distance_to_object(obj_player) < detectionRange && !isFriendly) {
	mp_linear_step(obj_player.x, obj_player.y, moveSpeed, 1);
	//Do melee or ranged attack??

}

// FRIENDLY VELOX BEHAVIOR (NOW MOVES RANDOMLY)
if (isFriendly) {
	//Do stuff
}

switch (direction div 90) {
	case 0:
		sprite_index=spr_velox_right;
		break;
	case 1:
		sprite_index=spr_velox_up;
		break;
	case 2:
		sprite_index=spr_velox_left;
		break;
	case 3:
		sprite_index=spr_velox_down;
		break;
}

// WHEN VELOX DIES
if (enemy_health <= 0) {
    if (isFriendly) {
        instance_create_layer(x, y, "Instances", obj_potion); // Drops potion
    }
    instance_destroy();
}