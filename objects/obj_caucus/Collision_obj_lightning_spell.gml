if (!other.did_damage) {
	enemy_health -= 20;	
	if (enemy_health <= 0)
		instance_destroy();
	other.did_damage = true;
}