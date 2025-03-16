if (obj_player.sages < 1) {
	instance_destroy();
	audio_play_sound(snd_sage,1,false);
	obj_player.sages += 1;
}

if (obj_hud.firstPickupSage) {
	obj_player.inTrigger = true;
	obj_hud.firstPickupSage = false;
	global.game_paused = !global.game_paused;
	instance_create_layer(x,y,"Instances",obj_dialogue_sagePickup);
	
}