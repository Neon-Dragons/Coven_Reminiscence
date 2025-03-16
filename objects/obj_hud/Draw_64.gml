// Get health values from the player object, divide by 10 for the HUD representation
var playerHealthFraction = frac(obj_player.playerHealth / 10);
var playerHealth = obj_player.playerHealth / 10;
var playerHealthMax = obj_player.playerHealthMax / 10;
playerHealth -= playerHealthFraction;

// If the game is not paused, proceed with drawing the HUD
if (!global.game_paused) {

    // Mana Bar
    if (instance_exists(obj_player)) {
        if (obj_player.level > 0) { // Only show if the player has level 1 or higher
            draw_sprite(spr_manabar_back, 1, 8, 64);
            draw_sprite_ext(spr_manabar, 1, 8, 64,
            max(0, obj_player.mana / obj_player.manaMax), 1, 0, c_white, 1);
        }
    }

    var margin = 0;

    // Hearts
    if (instance_exists(obj_player)) {
        for (var i = 1; i <= playerHealthMax; i++) {
            var imageIndex = (i > playerHealth);
            if (i == playerHealth + 1) {
                imageIndex += (playerHealthFraction > 0);
            }
            draw_sprite(spr_heart_alt, imageIndex, 8 + margin, 9);
            margin += 25;
        }
        margin = 0;
    }

    // Items (Sages and Potions)
    if (instance_exists(obj_player)) {
        if (obj_player.sages >= 1) {
            draw_sprite(spr_sage_slot, 1, 30, 110);
            draw_text(30 + 10, 110 + 20, "Press 1"); // Centered text under the sprite
        }

        if (obj_player.potions >= 1) {
            draw_sprite(spr_potion_slot, 1, 90, 110);
            draw_text(90 + 10, 110 + 20, "Press 2"); // Centered text under the sprite
        }
    }

    // HUD for abilities at the bottom of the screen
    var hud_y = display_get_height() - 40; // Position HUD at the bottom

    // Check the player's level and display available abilities accordingly
    if (obj_player.level >= 1) {
        draw_set_color(c_white);
        draw_text(20, hud_y, "Space - Fireball");

        if (obj_player.mana >= 10) {
            draw_set_color(make_color_rgb(160, 32, 240)); // Purple color if Fireball is ready
            draw_text(120, hud_y, "Ready");
        } else {
            draw_set_color(make_color_rgb(128, 128, 128)); // Gray color if Fireball is not ready
            draw_text(120, hud_y, "Unavailable");
        }
    }

    if (obj_player.level >= 2) {
        draw_set_color(c_white);
        draw_text(200, hud_y, "Q - Lightning");

        if (obj_player.mana >= 20) {
            draw_set_color(make_color_rgb(160, 32, 240)); // Purple color if Lightning is ready
            draw_text(300, hud_y, "Ready");
        } else {
            draw_set_color(make_color_rgb(128, 128, 128)); // Gray color if Lightning is not ready
            draw_text(300, hud_y, "Unavailable");
        }
    }

    if (obj_player.level >= 3) {
        draw_set_color(c_white);
        draw_text(400, hud_y, "E - Dark Magic");

        if (obj_player.mana >= 50) {
            draw_set_color(make_color_rgb(160, 32, 240)); // Purple color if Dark Magic is ready
            draw_text(500, hud_y, "Ready");
        } else {
            draw_set_color(make_color_rgb(128, 128, 128)); // Gray color if Dark Magic is not ready
            draw_text(500, hud_y, "Unavailable");
        }
    }
}

if (instance_exists(obj_player)) {

    // Only apply shader if the player is damaged or recently hit
    if (obj_player.playerHealth < obj_player.playerHealthMax * 0.3 || global.recentlyDamaged) {

        shader_set(shd_bloodstain);
        var damageUniform = shader_get_uniform(shd_bloodstain, "damageAmount");

        // Calculate how much blood overlay to show based on health
        var damageEffect = power(1.0 - (obj_player.playerHealth / obj_player.playerHealthMax), 2.0);

        // If recently damaged, boost effect for 1 second
        if (global.recentlyDamaged) {
            damageEffect = max(damageEffect, 0.7);
        }

        // Don't apply shader if damageEffect is 0
        if (damageEffect > 0) {
            shader_set_uniform_f(damageUniform, damageEffect);
            draw_rectangle_color(0, 0, display_get_width(), display_get_height(), c_white, c_white, c_white, c_white, false);
        }

        shader_reset();
    }
}




