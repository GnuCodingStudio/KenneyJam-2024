class_name InfiniteLoader
extends Node2D

@onready var player_one: Player = %PlayerOne
@onready var player_two: Player = %PlayerTwo
@onready var end_position: Node2D = %EndPosition
@onready var stop_wall: Node2D = %StopWall


const DISTANCE_BEFORE_LOADING_NEXT = 1280
const DISTANCE_TO_UNLOAD_LEVEL = (2 * 1280)

var _levels: Array[BasicLevel] = []
var _possible_levels := [
	#"res://scenes/levels/DebugLevel.tscn",
	"res://scenes/levels/LevelLabyrinth01.tscn",
	"res://scenes/levels/LevelLabyrinth02.tscn",
]


func _process(_delta):
	if _is_near_the_end(player_one) or _is_near_the_end(player_two):
		print("Need to load a new level")
		var next_level = _load_next_level()
		next_level.position = end_position.position
		_levels.push_back(next_level)
		add_child(next_level)

		_move_end_to_next_end(next_level.end_position)
		_unload_old_levels()


func _load_next_level() -> BasicLevel:
	return load(_possible_levels.pick_random()).instantiate()


func _is_near_the_end(player: Player) -> bool:
	return player.global_position.distance_to(end_position.global_position) < DISTANCE_BEFORE_LOADING_NEXT


func _is_far_from_previous(player: Player, level: BasicLevel) -> bool:
	return player.global_position.distance_to(level.end_position.global_position) > DISTANCE_TO_UNLOAD_LEVEL


func _move_end_to_next_end(next_end: Node2D) -> void:
	end_position.global_position = next_end.global_position


func _unload_old_levels() -> void:
	for level in _levels.slice(0, -3):
		if _is_far_from_previous(player_one, level) and _is_far_from_previous(player_two, level):
			print("Need to free an old level")
			_move_stop_wall_to(level.end_position)
			_levels.erase(level)
			level.queue_free()


func _move_stop_wall_to(node: Node2D) -> void:
	stop_wall.global_position = node.global_position
	stop_wall.visible = true
