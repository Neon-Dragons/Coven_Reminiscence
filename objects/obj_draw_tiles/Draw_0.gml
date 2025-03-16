// Activate the grayscale shader
shader_set(shd_greyscale);

// Get the tilemap ID from the tile layer
var tileLayerID = layer_tilemap_get_id("Tiles_1");

// Draw the tilemap at position (0, 0)
draw_tilemap(tileLayerID, 0, 0);

// Reset back to default rendering
shader_reset();
