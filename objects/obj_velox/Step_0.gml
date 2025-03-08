if (distance_to_object(obj_player) < detectionRange && !isFriendly) {
	mp_linear_step(obj_player.x, obj_player.y, moveSpeed, 1);

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