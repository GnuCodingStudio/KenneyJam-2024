class_name SimpleTriggerable
extends Node

@export var trigger: Node
@export var activating_method: String
@export var deactivating_method: String

func _ready() -> void:
	var parent = get_parent()
	assert(trigger.has_signal("on_activated"), "Trigger has no on_activated signal: %s" % trigger)
	assert(trigger.has_signal("on_deactivated"), "Trigger has no on_deactivated signal: %s" % trigger)
	assert(parent.has_method(activating_method), "Parent has no \"%s\" method" % activating_method)
	assert(parent.has_method(deactivating_method), "Parent has no \"%s\" method" % deactivating_method)
	
	trigger.on_activated.connect(_open_parent)
	trigger.on_deactivated.connect(_close_parent)


func _open_parent() -> void:
	get_parent().call_deferred(activating_method)


func _close_parent() -> void:
	get_parent().call_deferred(deactivating_method)