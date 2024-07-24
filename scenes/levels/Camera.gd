extends Camera2D


@export var playerOne: Player
@export var playerTwo: Player


func _process(delta):
	position = (playerOne.position + playerTwo.position) / 2
