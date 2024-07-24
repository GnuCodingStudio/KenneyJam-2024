extends Node2D


@export var playerOne: Player
@export var playerTwo: Player


func _process(delta):
	queue_redraw()


func _draw():
	draw_line(playerOne.position, playerTwo.position, Color.DARK_GRAY, 5.0, true)
