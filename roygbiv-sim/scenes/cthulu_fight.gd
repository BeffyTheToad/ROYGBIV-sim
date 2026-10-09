extends Node2D
var tween = create_tween()
var rainCount := 3
var rain_scene = load("res://scenes/rain.tscn")
func _process(_delta: float) -> void:
	var drop
	for i in rainCount:
		drop = rain_scene.instantiate()
		$Rain.add_child(drop)


func _on_end_timer_timeout() -> void:
	var tween = create_tween()
	tween.tween_property($CthuluBody, "position", Vector2($CthuluBody.position.x, -500),1)
	rainCount = 0
	tween.tween_property($ColorRect, "color", Color(0.494, 0.784, 0.89, 1.0), 2)
	tween.tween_property($Rainbow, "position", Vector2(640,150), 4)
