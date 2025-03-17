// Example unlocks based on player level
if (obj_player.level >= 1) abilities_unlocked[0] = 1; // Sneak
if (obj_player.level >= 2) abilities_unlocked[1] = 1; // Fireball
if (obj_player.level >= 3) abilities_unlocked[2] = 1; // Lightning
if (obj_player.level >= 4) abilities_unlocked[3] = 1; // Dark Magic

// If you use triggers instead of levels, set unlocked inside those triggers like:
// abilities_unlocked[0] = 1; (inside your obj_trigger events)
