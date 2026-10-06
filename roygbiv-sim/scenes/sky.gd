extends Node2D

var rng := RandomNumberGenerator.new()
var cloud_scene : PackedScene = load("res://scenes/cloud.tscn")

func _ready() -> void:
	var p = Global.player_scene.instantiate()
	self.add_child(p)
	
	var num_clouds = rng.randi_range(4,8)
	var cloud
	for i in num_clouds:
		cloud = cloud_scene.instantiate()
		$Clouds.add_child(cloud)
		
func _on_bottom_of_sky_body_entered(_body: Node2D) -> void:
	Global.player_pos[0] = Global.player.position.x
	Global.player_velocity = Global.player.velocity
	Global.layers_left -= 1
	get_tree().reload_current_scene.call_deferred()
