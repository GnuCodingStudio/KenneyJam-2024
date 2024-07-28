extends Node2D


@export var playerOne: Player
@export var playerTwo: Player

signal link_broken


var _broken := false


func _process(delta):
	queue_redraw()
	if not _broken and _is_broken():
		_broken = true
		link_broken.emit()


func _draw():
	if not _broken:
		draw_line(playerOne.position, playerTwo.position, Color.DARK_GRAY, 5.0, true)


func _is_broken():
	var spaceState = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(playerOne.global_position, playerTwo.global_position)
	query.collision_mask = 0b100
	var result = spaceState.intersect_ray(query)
	return result != null and result.has("collider")
