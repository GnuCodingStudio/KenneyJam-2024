extends Node


var _inner_rng := RandomNumberGenerator.new()


func set_seed(seed: int) -> void:
	_inner_rng.seed = seed


func randi_range(from: int, to: int) -> int:
	return _inner_rng.randi_range(from, to)
