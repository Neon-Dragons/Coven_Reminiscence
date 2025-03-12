if (obj_player.sages < 1) {
	instance_destroy();
	audio_play_sound(snd_sage,1,false);
	obj_player.sages += 1;
}