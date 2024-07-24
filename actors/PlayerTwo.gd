extends "res://actors/Player.gd"


func _get_direction_vector() -> Vector2:
	return Input.get_vector("p2_move_left", "p2_move_right", "p2_move_up", "p2_move_down")
