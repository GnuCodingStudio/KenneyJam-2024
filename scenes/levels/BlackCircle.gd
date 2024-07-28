extends Node2D

@onready var animation_player = %AnimationPlayer

signal finished

var _size: Vector2i = Vector2i(0, 0)


func start(size: Vector2i):
	_size = size
	animation_player.play("loading")
	queue_redraw()


func _draw():
	var radius = max(_size.x, _size.y) * 1.2
	draw_circle(position, radius, Color.BLACK)


func _loading_finished():
	finished.emit()
