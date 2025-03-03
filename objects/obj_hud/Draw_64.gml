
var playerHealthFraction = frac(obj_player.playerHealth / 10)
var playerHealth = obj_player.playerHealth / 10
var playerHealthMax = obj_player.playerHealthMax / 10;
playerHealth -= playerHealthFraction
//Mana Bar
if (instance_exists(obj_player)) {
	
	draw_sprite(spr_manabar_back,1,8,64)
	draw_sprite_ext(spr_manabar,1,8,64,
	max(0,obj_player.mana/obj_player.manaMax),1,0,c_white,1)
}

var margin = 0
//Hearts
if (instance_exists(obj_player)) {

	for (var i = 1; i <= playerHealthMax; i++) {	
		var imageIndex = (i > playerHealth)
		if (i == playerHealth + 1){
			imageIndex += (playerHealthFraction > 0)
			//imageIndex += (playerHealthFraction > 0.25)
			//imageIndex += (playerHealthFraction > 0.5)
		}
		draw_sprite(spr_heart,
			imageIndex,
			8 + margin,9)
		
		margin += 25;
	}
	margin = 0

}