class_name SeedInput
extends LineEdit


var seed: int = 0:
	set(value):
		seed = value
		text = str(value)


func _on_text_changed(new_text: String) -> void:
	if new_text.is_valid_int():
		seed = new_text.to_int()
	else:
		text = str(seed)
