extends Node2D


@onready var player_one = %PlayerOne
@onready var player_two = %PlayerTwo
@onready var camera = %Camera
@onready var black_circle = %BlackCircle
@onready var you_failed = %YouFailed
@onready var end_position: Node2D = %EndPosition


func _process(_delta):
	black_circle.position = camera.position
	you_failed.position = camera.position


func _on_linky_broken():
	_disable_players()
	you_failed.show()
	black_circle.start(get_window().size)
	await black_circle.finished
	get_tree().reload_current_scene()


func _disable_players():
	player_one.disable()
	player_two.disable()
	camera.disable()
