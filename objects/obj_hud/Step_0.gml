// Ensure global variables exist before checking them
if (!variable_global_exists("recentlyDamaged")) {
    global.recentlyDamaged = false;
}

if (!variable_global_exists("damageTimer")) {
    global.damageTimer = 0;
}

// Now check if the damage effect should disappear
if (global.recentlyDamaged && current_time >= global.damageTimer) {
    global.recentlyDamaged = false;
    show_debug_message("Damage effect ended, resetting shader.");
}
