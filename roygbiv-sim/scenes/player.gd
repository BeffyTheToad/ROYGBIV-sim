extends CharacterBody2D


@export var speed = 300.0
const JUMP_VELOCITY = -400.0
var can_move := true

func _ready() -> void:
	Global.player = self
	position = Global.player_pos
	velocity = Global.player_velocity

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and velocity.y <= 3000:
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
