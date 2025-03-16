// Script: cast_magic(magic_type)
// Argument0: magic_type (MagicType enum value)

var magic_type = argument0;
var _projectile; // Declare _projectile here

switch (magic_type) {
    case MagicType.Water:
        // Water Magic Effect
        // Create a blue rectangle (placeholder for water magic)
        _projectile = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_projectile);
        _projectile.direction = obj_player.image_angle;
        _projectile.speed = 5;
        _projectile.image_angle = _projectile.direction;
        _projectile.magic_type = MagicType.Water;
        break;
    case MagicType.Fire:
        // Fire Magic Effect
        // Create a red rectangle (placeholder for fire magic)
        _projectile = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_projectile);
        _projectile.direction = obj_player.image_angle;
        _projectile.speed = 5;
        _projectile.image_angle = _projectile.direction;
        _projectile.magic_type = MagicType.Fire;
        break;
    case MagicType.Electricity:
        // Electricity Magic Effect
        // Create a yellow rectangle (placeholder for electricity magic)
        _projectile = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_projectile);
        _projectile.direction = obj_player.image_angle;
        _projectile.speed = 5;
        _projectile.image_angle = _projectile.direction;
        _projectile.magic_type = MagicType.Electricity;
        break;
    case MagicType.Earth:
        // Earth Magic Effect
        // Create a green rectangle (placeholder for earth magic)
        _projectile = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_projectile);
        _projectile.direction = obj_player.image_angle;
        _projectile.speed = 5;
        _projectile.image_angle = _projectile.direction;
        _projectile.magic_type = MagicType.Earth;
        break;
    case MagicType.Dark:
        // Dark Magic Effect
        // Create a purple rectangle (placeholder for dark magic)
        _projectile = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_projectile);
        _projectile.direction = obj_player.image_angle;
        _projectile.speed = 5;
        _projectile.image_angle = _projectile.direction;
        _projectile.magic_type = MagicType.Dark;
        break;
}
