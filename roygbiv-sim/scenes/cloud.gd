extends Area2D

var rng := RandomNumberGenerator.new()

func _ready() -> void:
	var width = get_viewport().get_visible_rect().size[0]
	var cloud_pos : Vector2
	#var cloud_size : float
	var cloud_png := load("res://assets/cloud2-removebg-preview.png")
	cloud_pos = Vector2(rng.randi_range(0,width), rng.randi_range(500, 700))
	#cloud_size = rng.randf_range(0.5,1.5)
	#cloud_png = 
	$cloudImage.texture = cloud_png
	position = cloud_pos

func _on_body_entered(body: Node2D) -> void:
	body.velocity.y -= int((body.velocity.y)/3)
