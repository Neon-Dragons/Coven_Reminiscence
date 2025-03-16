if (obj_player.potions < 1) {
	instance_destroy();
	audio_play_sound(snd_potion,1,false);
	obj_player.potions += 1;
}

if (obj_hud.firstPickupPotion) {
	obj_player.inTrigger = true;
	obj_hud.firstPickupPotion = false;
	global.game_paused = !global.game_paused;
	instance_create_layer(x,y,"Instances",obj_dialogue_potionPickup);
	
}
