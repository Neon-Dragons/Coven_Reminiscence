// Position Offsets (from bottom-left corner of view)
menu_x_offset = 20;   // 20px from the left
menu_y_offset = 20;   // 20px from the bottom

// Menu Dimensions
menu_width = 150;     // Small, clean width
line_height = 20;     // Space between abilities
base_height = 30;     // Height reserved for the title

// Abilities List (what appears in the menu)
abilities_list = [
    "Sneak",        // Index 0
    "Fireball",     // Index 1
    "Lightning",    // Index 2
    "Dark Magic"    // Index 3
];

// Commands List (what key you press for each ability)
abilities_commands = [
    "Shift",        // Sneak
    "Space",        // Fireball
    "Q",            // Lightning
    "E"             // Dark Magic
];

// Unlock Status (0 = locked, 1 = unlocked)
abilities_unlocked = [0, 0, 0, 0]; // Everything starts locked
