extends Node

const INTRO = preload("res://assets/audio/Linky main theme intro.ogg")
const MAIN_THEME = preload("res://assets/audio/Linky main theme.ogg")

var _player = AudioStreamPlayer.new()

func _init() -> void:
	add_child(_player)
	_player.stream = INTRO
	_player.bus = &"Music"


func play() -> void:
	if _player.playing:
		return

	_player.play()

	await _player.finished

	_player.stream = MAIN_THEME
	_player.play()
