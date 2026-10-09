extends Node2D

var rng := RandomNumberGenerator.new()
var cloud_scene : PackedScene = load("res://scenes/cloud.tscn")

func _ready() -> void:
	$GarageSprite.texture = Global.garage_sprite_current
	var p = Global.player_scene.instantiate()
	self.add_child(p)
	if Global.layers_left == 0:
		$skyBg.texture = load("res://assets/Garage BG.png")
		$GarageSprite.visible = true
		$bottomOfSky.position.y = 250
		if Global.player.position.x >= 1000:
			$GarageSprite.position.x += 250
		elif Global.player.position.x <= 300:
			$GarageSprite.position.x -= 250
		Global.garage_sprite_x = $GarageSprite.position.x
	else:
		var num_clouds = rng.randi_range(3,5)
		var cloud
		for i in num_clouds:
			cloud = cloud_scene.instantiate()
			$Clouds.add_child(cloud)
		
func _on_bottom_of_sky_body_entered(_body: Node2D) -> void:
	Global.player_pos[0] = Global.player.position.x
	Global.player_velocity = Global.player.velocity
	Global.layers_left -= 1
	if Global.layers_left > -1:
		get_tree().reload_current_scene.call_deferred()
	else:
		Global.garage_hp -= int(Global.player_velocity.y)
		get_tree().change_scene_to_file.call_deferred("res://scenes/end.tscn")
