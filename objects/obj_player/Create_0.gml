currentState = MovementState.Running;
facingAngle = 270;
stopWalking = false;
global.game_paused = false; // Global variable for pause state
global.game_over = false; // Ensure the variable exists before use
global.show_pause_menu = false;
global.pause_selected_option = 0;  // Selection for Pause Menu
global.gameover_selected_option = 0; // Selection for Game Over Menu

// === INITIALIZE GLOBAL VARIABLES ===
if (!variable_global_exists("message_timer")) global.message_timer = 0;
if (!variable_global_exists("display_message")) global.display_message = "";
global.recentlyDamaged = false;
global.damageTimer = 0;
previousHealth = playerHealth; // Initialize previous health to the starting value
global.viewportWidth = display_get_width();
global.viewportHeight = display_get_height();
// === Initialize message variables ===
global.saved_message = "";
global.saved_message_timer = 0;

global.loaded_message = "";
global.loaded_message_timer = 0;
// ✅ NEW: Prevent immediate auto-save after loading
global.just_loaded = false;
global.just_loaded_timer = 0; // Timer for blocking auto-save
// ✅ Initialize Variables to Prevent Errors
global.load_pending = false;
global.apply_saved_data = false;
global.save_exists = false;
global.auto_save_cooldown = 0;


