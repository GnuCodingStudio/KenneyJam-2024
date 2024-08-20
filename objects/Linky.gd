extends Node2D

@export var playerOne: Player
@export var playerTwo: Player

@onready var beam = %Beam

signal link_broken


var _broken := false


func _process(delta):
	var diff_vector = (playerTwo.position - playerOne.position)
	var center = playerOne.position + (diff_vector / 2)
	var distance = diff_vector.length()

	position = center
	rotation = playerOne.position.angle_to_point(playerTwo.position)
	beam.scale.x = distance / 65

	if not _broken and _is_broken():
		_broken = true
		link_broken.emit()
		beam.visible = false


func _is_broken():
	var spaceState = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(playerOne.global_position, playerTwo.global_position)
	query.collision_mask = 0b100
	var result = spaceState.intersect_ray(query)
	return result != null and result.has("collider")
