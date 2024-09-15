@tool
extends Node2D
class_name KeyboardHint


@export var up: Texture2D
@export var down: Texture2D
@export var left: Texture2D
@export var right: Texture2D

@onready var up_sprite = %UP
@onready var down_sprite = %DOWN
@onready var left_sprite = %LEFT
@onready var right_sprite = %RIGHT

func _ready():
	up_sprite.texture = up
	down_sprite.texture = down
	left_sprite.texture = left
	right_sprite.texture = right
