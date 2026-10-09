extends Node2D

var rng = RandomNumberGenerator.new()
var speed = 5
func _ready() -> void:
	position = Vector2(rng.randi_range(0,2000),rng.randi_range(-90,-64))

func _process(_delta: float) -> void:
	position += Vector2(-1,1) * speed
