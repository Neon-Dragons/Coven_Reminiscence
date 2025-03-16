if (!global.just_loaded) { // ✅ Prevent saving if game just loaded
    show_debug_message("Collision with Auto-Save Trigger!");
    save_game();
} else {
    show_debug_message("Auto-save prevented after load.");
}
