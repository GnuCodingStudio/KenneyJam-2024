@tool
class_name Door
extends StaticBody2D


@onready var sprite: AnimatedSprite2D = %Sprite
@onready var collision: CollisionShape2D = %Collision
@onready var open_audio: AudioStreamPlayer = %OpenAudio
@onready var close_audio: AudioStreamPlayer = %CloseAudio



func open() -> void:
	collision.disabled = true
	sprite.play("opened")
	open_audio.play()


func close() -> void:
	collision.disabled = false
	sprite.play("closed")
	close_audio.play()
