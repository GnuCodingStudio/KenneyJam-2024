extends RigidBody2D
class_name Player

@export_group("Movement")
@export var acceleration := 1500
@export var max_speed := 900
@export var damping := 6

var _direction: Vector2
var _enabled := true

func _process(delta):
	if _enabled:
		_direction = _get_direction_vector()
	else:
		_direction = Vector2.ZERO


func _physics_process(delta):
	if _direction != Vector2.ZERO:
		linear_damp = 0
		apply_force(_direction * acceleration)
		linear_velocity = linear_velocity.limit_length(max_speed)
	else:
		linear_damp = damping


func disable():
	_enabled = false


func _get_direction_vector() -> Vector2:
	return Vector2.ZERO
