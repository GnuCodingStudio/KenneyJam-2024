class_name YouFailed
extends Control


@onready var failure_animation: AnimationPlayer = %FailureAnimation
@onready var transition_rect: ColorRect = %TransitionRect


@export var progress: float = 0.0:
	set(value):
		progress = value
		_on_progress_changed(value)


signal animation_finished()


func start() -> void:
	if !failure_animation.is_playing():
		show()
		failure_animation.play("failure")


func _on_animation_finished():
	print("_on_animation_finished")
	animation_finished.emit()


func _on_progress_changed(new_progress: float) -> void:
	var shader = (transition_rect.material as ShaderMaterial)
	shader.set_shader_parameter("progression", new_progress)
