extends Node2D


@onready var player_one = %PlayerOne
@onready var player_two = %PlayerTwo
@onready var camera = %Camera
@onready var you_failed: YouFailed = %YouFailed


func _on_linky_broken():
	_disable_players()
	you_failed.start()


func _disable_players():
	player_one.disable()
	player_two.disable()
	camera.disable()


func _on_you_failed_animation_finished() -> void:
	get_tree().reload_current_scene()
