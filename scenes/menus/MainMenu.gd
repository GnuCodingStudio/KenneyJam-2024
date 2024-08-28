extends Control


@onready var start_button: Button = %StartButton
@onready var background: ColorRect = %Background
@onready var seed_input: SeedInput = %SeedInput

var _rng = RandomNumberGenerator.new()


func _ready():
	start_button.grab_focus()
	var noise = background.material.get_shader_parameter("Noise").noise
	var over_noise = background.material.get_shader_parameter("OverNoise").noise
	noise.seed = _rng.randi()
	over_noise.seed = _rng.randi()
	seed_input.seed = _rng.randi()


func _on_start_button_pressed():
	Rng.set_seed(seed_input.seed)
	get_tree().change_scene_to_file("res://scenes/levels/Level01.tscn")


func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/credits/CreditsMenu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
