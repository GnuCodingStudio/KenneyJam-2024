@tool
class_name Door
extends StaticBody2D


@onready var sprite: AnimatedSprite2D = %Sprite
@onready var collision: CollisionShape2D = %Collision


func open() -> void:
	collision.disabled = true
	sprite.play("opened")


func close() -> void:
	collision.disabled = false
	sprite.play("closed")
