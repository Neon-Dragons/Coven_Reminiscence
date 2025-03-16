

obj_player.level += 1;
obj_player.stopWalking = true;
obj_player.inTrigger = true;
global.game_paused = !global.game_paused;
instance_destroy();
instance_create_layer(x,y,"Instances",obj_dialogue_child1);