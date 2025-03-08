if (distance_to_object(obj_player) < detectionRange) {
	mp_linear_step(obj_player.x, obj_player.y, moveSpeed, 1);

}
	
if (place_meeting(x, y + 2, obj_player) == true) {
	timer--
	if (timer <= 0) {
		instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_melee_attack)
		timer = 30;
		obj_player.playerHealth -= 10;
	}
	
}
if (place_meeting(x, y - 2, obj_player) == true) {
	timer--
	if (timer <= 0) {
		instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_melee_attack)
		timer = 30;
		obj_player.playerHealth -= 10;
	}
}

if (place_meeting(x + 2, y, obj_player) == true) {
	timer--
	if (timer <= 0) {
		instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_melee_attack)
		timer = 30;
		obj_player.playerHealth -= 10;
	}
}

if (place_meeting(x - 2, y, obj_player) == true) {
	timer--
	if (timer <= 0) {
		instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_melee_attack)
		timer = 30;
		obj_player.playerHealth -= 10;
	}
}
switch (direction div 90) {
	case 0:
		sprite_index=spr_belliger_right;
		break;
	case 1:
		sprite_index=spr_belliger_up;
		break;
	case 2:
		sprite_index=spr_belliger_left;
		break;
	case 3:
		sprite_index=spr_belliger_down;
		break;
}