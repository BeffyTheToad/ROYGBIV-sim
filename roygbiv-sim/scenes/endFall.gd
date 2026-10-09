extends Control

var sky_scene : PackedScene = load("res://scenes/sky.tscn")
var cthulu_scene := load("res://scenes/cthulu_fight.tscn")
var done := false
func rond(num: float, dec: int) -> float:
	var ret: float = num
	ret *= pow(10,dec)
	ret = roundf(ret)
	ret /= pow(10,dec)
	return ret

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.garage_hp >= -2500:
			@warning_ignore("integer_division")
			Global.garage_sprite_current = load("res://assets/Garage Stage " +str(4 - round(Global.garage_hp/2500)) + ".png")
	$GarageSprite.texture = Global.garage_sprite_current
	if Global.garage_hp <= 0:
		$CthuluSteps.start()
		done = true
		var tween = create_tween()
		var tween2 = create_tween()
		tween.tween_property($ColorRect, "color", Color(0.188, 0.137, 0.376, 1.0), 3)
		tween2.tween_property($MarginContainer/VBoxContainer/Label, "visible", false, 4)
		$MarginContainer/VBoxContainer/Label2.visible = false
		$MarginContainer/VBoxContainer/Label.text = "..."
		$MarginContainer/VBoxContainer/Label.add_theme_color_override("font_color", Color(302360))
		tween.tween_property($cthuluSprite, "position", Vector2(640, 175), 4)
		tween2.tween_property($cthuluSprite, "scale", Vector2(2,2), 4)
	else:
		$GarageSprite.position.x = Global.garage_sprite_x
		$CenterContainer/VBoxContainer/garageLabelTemp.text = "Garage Hp: " + str(Global.garage_hp)
		$CenterContainer/VBoxContainer/velcocityLabel.text = "The van hit the garage at " + str(rond(Global.player_velocity[1]*0.058,1)) + " miles per hour"

func _input(event) -> void:
	if event.is_action_pressed("jump") and not done:
		Global.layers_left = 10
		Global.player_velocity = Vector2(0,0)
		Global.player_pos = Vector2(640,0)
		get_tree().change_scene_to_packed(sky_scene)


func _on_cthulu_steps_timeout() -> void:
	get_tree().change_scene_to_packed(cthulu_scene)
