function load_game() {
    if (file_exists("savefile.ini")) {
        ini_open("savefile.ini");

        // ✅ Load Save Data Into Global Variables
        global.saved_x = ini_read_real("Player", "x", 0);
        global.saved_y = ini_read_real("Player", "y", 0);
        global.saved_health = ini_read_real("Player", "health", 100);
        global.saved_mana = ini_read_real("Player", "mana", 100);
        global.saved_potions = ini_read_real("Player", "potions", 0);
        global.saved_sages = ini_read_real("Player", "sages", 0);
        global.saved_level = ini_read_real("Player", "level", 1);
        global.saved_facingAngle = ini_read_real("Player", "facingAngle", 0);
        global.saved_moveSpeed = ini_read_real("Player", "moveSpeed", 3);
        global.saved_room = ini_read_string("Game", "room", "");
        global.save_exists = ini_read_real("Game", "save_exists", 0);

        ini_close();

        // ✅ If the saved room is different from the current room, move there
        if (global.saved_room != "" && room_get_name(room) != global.saved_room) {
            global.load_pending = true; // ✅ Ensure the player loads in the correct place
            room_goto(asset_get_index(global.saved_room));
        } else {
            // ✅ If already in the correct room, apply saved data directly
            global.apply_saved_data = true;
        }

        global.display_message = "Game Loaded!";
        global.message_timer = 30;

        show_debug_message("Game Loaded Successfully!");
    } else {
        global.display_message = "No Save Data!";
        global.message_timer = 30;
        show_debug_message("No Save File Found!");
    }
}
