extends Camera2D


@export var playerOne: Player
@export var playerTwo: Player


var _enabled := true

func _process(delta):
	if enabled:
		position = (playerOne.position + playerTwo.position) / 2


func disable():
	_enabled = false
