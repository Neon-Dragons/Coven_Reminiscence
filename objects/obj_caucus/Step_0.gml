if (global.game_over)
	return;
if (global.game_paused) {
    return
}
if (distance_to_object(obj_player) < detectionRange 
	&& obj_player.currentState == MovementState.Running) {
	mp_linear_step(obj_player.x, obj_player.y, moveSpeed, 1);
	timer--
	if (timer <= 0) {
		instance_create_layer(x, y, "Instances", obj_caucus_attack)
		show_debug_message("🏹 Ranged Attack!");
		timer = 20;
	}

}
else {
	timer = 0;
}
if enemy_health <= 0 {
    instance_create_layer(x, y, "Instances", obj_sage);
	instance_destroy();	
	
}
mask_index = spr_caucus_down;
switch (direction div 90) {
	case 0:
		sprite_index=spr_caucus_right;
		break;
	case 1:
		sprite_index=spr_caucus_up;
		break;
	case 2:
		sprite_index=spr_caucus_left;
		break;
	case 3:
		sprite_index=spr_caucus_down;
		break;
}