extends Node2D

@export var playerOne: Player
@export var playerTwo: Player

@onready var beam = %Beam
@onready var particles = %BeamParticles

signal link_broken


var _broken := false


func _process(delta):
	beam.points[0] = playerOne.position
	beam.points[1] = playerTwo.position

	var diff_vector = (playerTwo.position - playerOne.position)
	var distance = diff_vector.length()
	particles.position = playerOne.position + (diff_vector / 2)
	particles.process_material.emission_box_extents.x = distance / 2
	particles.amount = distance * 0.8
	particles.rotation = playerOne.position.angle_to_point(playerTwo.position)

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
