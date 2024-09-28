extends Control


@onready var continue_button: Button = %ContinueButton
@onready var start_button: Button = %StartButton
@onready var quit_button: Button = %QuitButton
@onready var background: ColorRect = %Background
@onready var seed_input: SeedInput = %SeedInput


func _ready() -> void:
	var noise = background.material.get_shader_parameter("Noise").noise
	var over_noise = background.material.get_shader_parameter("OverNoise").noise
	noise.seed = randi()
	over_noise.seed = randi()
	seed_input.seed = randi()
	
	ProgressionService.init()
	if ProgressionService.save_exists():
		continue_button.visible = true
		continue_button.grab_focus()
		start_button.focus_neighbor_left = continue_button.get_path()
		start_button.focus_previous = continue_button.get_path()
		quit_button.focus_neighbor_right = continue_button.get_path()
		quit_button.focus_next = continue_button.get_path()
	else:
		continue_button.visible = false
		start_button.grab_focus()

	GlobalMusicPlayer.play()


func _on_continue_button_pressed() -> void:
	var progression = ProgressionService.data
	seed(progression.seed)
	get_tree().change_scene_to_file("res://scenes/levels/Level01.tscn")


func _on_start_button_pressed() -> void:
	seed(seed_input.seed)
	var progression = Progression.new(seed_input.seed, 0)
	ProgressionService.save(progression)
	get_tree().change_scene_to_file("res://scenes/levels/Level01.tscn")


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/credits/CreditsMenu.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
