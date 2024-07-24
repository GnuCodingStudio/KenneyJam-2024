extends "res://actors/Player.gd"


func _get_direction_vector() -> Vector2:
	return Input.get_vector("p1_move_left", "p1_move_right", "p1_move_up", "p1_move_down")
