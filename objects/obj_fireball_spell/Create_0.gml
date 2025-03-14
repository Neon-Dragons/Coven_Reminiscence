speed = 10;
partSystem = part_system_create(FireballParticle);
part_system_position(partSystem, x, y);
part_system_angle(partSystem, obj_player.facingAngle-270);
direction = obj_player.facingAngle;