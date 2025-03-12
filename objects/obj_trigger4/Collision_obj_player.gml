obj_player.level += 1;
obj_player.playerHealth += 10;
obj_player.playerHealthMax += 10;
obj_player.inTrigger = true;
global.game_paused = !global.game_paused;
instance_destroy();
instance_create_layer(x,y,"Instances",obj_dialogue_child4);