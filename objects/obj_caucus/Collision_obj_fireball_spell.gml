enemy_health -= 10;
instance_destroy(other)
if enemy_health <= 0
	instance_destroy();