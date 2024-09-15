@tool
class_name PressurePlate
extends Area2D


@onready var sprite: Sprite2D = %Sprite


@export var for_player: DetectedPlayer = DetectedPlayer.BOTH


var _pression: float = 0.0:
	set(value):
		_pression = value
		(sprite.material as ShaderMaterial).set_shader_parameter("pression", value)


func _ready() -> void:
	match(for_player):
		DetectedPlayer.ONE:
			_modulate_shader(Colors.playerOne())
			collision_mask = 0b01
		DetectedPlayer.TWO:
			_modulate_shader(Colors.playerTwo())
			collision_mask = 0b10
		DetectedPlayer.BOTH:
			_modulate_shader(Colors.playerBoth())
			collision_mask = 0b11


func on_activated() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "_pression", 1.0, 0.1)


func on_deactivated() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "_pression", 0.0, 0.1)


func _modulate_shader(color: Color) -> void:
	(sprite.material as ShaderMaterial).set_shader_parameter("modulate", color)


enum DetectedPlayer {
	ONE, TWO, BOTH
}
