extends Control
var sky : PackedScene = load("res://scenes/sky.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump"):
		get_tree().change_scene_to_packed(sky)
