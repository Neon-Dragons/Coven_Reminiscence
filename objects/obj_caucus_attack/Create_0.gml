audio_play_sound(snd_fireball_spell,1,false);

speed = 20;
if instance_exists(obj_player) {
		direction = point_direction(x,y, obj_player.x, obj_player.y)
} else {
	direction = 270;
}