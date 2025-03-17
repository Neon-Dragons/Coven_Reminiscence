// Triggering the end screen and stopping player actions
obj_player.inTrigger = true;
obj_player.stopWalking = true;
obj_player.completedLevel = true; // Mark the level as completed

global.game_paused = !global.game_paused; // Pause the game

// Destroy current instances and create the dialogue (could be credits or other dialogue)
instance_destroy(); // Destroy current instances in the room
instance_create_layer(x, y, "Instances", obj_dialogue_child5); // Example: Create dialogue or credits object

room_goto(rm_end_screen); // Go to the end screen room (this should be where credits will be shown)
credits_shown = true; // Flag to show credits