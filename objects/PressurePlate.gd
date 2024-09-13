@tool
class_name PressurePlate
extends Area2D


@onready var sprite: Sprite2D = %Sprite


@export var for_player: DetectedPlayer = DetectedPlayer.BOTH


func _ready() -> void:
	match(for_player):
		DetectedPlayer.ONE:
			sprite.self_modulate = Colors.playerOne()
			collision_mask = 0b01
		DetectedPlayer.TWO:
			sprite.self_modulate =  Colors.playerTwo()
			collision_mask = 0b10
		DetectedPlayer.BOTH:
			sprite.self_modulate =  Colors.playerBoth()
			collision_mask = 0b11


enum DetectedPlayer {
	ONE, TWO, BOTH
}
