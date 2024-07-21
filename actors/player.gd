extends RigidBody2D
class_name Player

@export_group("Movement")
@export var acceleration := 1500
@export var max_speed := 900
@export var damping := 6

var _direction: Vector2

func _process(delta):
	_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")


func _physics_process(delta):
	if _direction != Vector2.ZERO:
		linear_damp = 0
		apply_force(_direction * acceleration)
		linear_velocity = linear_velocity.limit_length(max_speed)
	else:
		linear_damp = damping
