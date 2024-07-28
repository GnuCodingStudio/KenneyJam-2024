extends Node2D


@onready var player_one = %PlayerOne
@onready var player_two = %PlayerTwo
@onready var camera = %Camera


func _on_linky_broken():
	player_one.disable()
	player_two.disable()
	var failed = preload("res://scenes/levels/YouFailed.tscn").instantiate()
	failed.position = camera.position
	add_child(failed)
	await get_tree().create_timer(1.5).timeout
	get_tree().reload_current_scene()
