extends CharacterBody2D

var rng := RandomNumberGenerator.new()
@export var speed := 700
var moving_right := (rng.randi()%2 == 1)
var direction : Vector2
var count: float = 0
var health: int = 25
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	count += 0.1
	if moving_right:
		direction = Vector2(1,1)
	else:
		direction = Vector2(-1,1)
	velocity.x = direction[0] * speed
	velocity.y = direction[1] * 300 * sin(count)
	move_and_slide()


func _on_movement_timer_timeout() -> void:
	print("TIME")
	moving_right = rng.randi()%2 == 1
	$MovementTimer.wait_time = rng.randf_range(0.3, 0.8)
	speed = rng.randi_range(300, 700)
	
