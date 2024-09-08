extends Node


@export var triggers: Array[Node]
@export var activating_method: String
@export var deactivating_method: String
@export var condition: TriggerCondition = TriggerCondition.ALL

enum TriggerCondition {
	ALL, ANY, ONE
}

var activated := false

func _ready() -> void:
	var parent = get_parent()
	assert(parent.has_method(activating_method), "Parent has no %s method" % activating_method)
	assert(parent.has_method(deactivating_method), "Parent has no %s method" % deactivating_method)
	for trigger in triggers:
		assert(trigger.has_signal("on_activated"), "Trigger has no \"on_activated\" signal: %s" % trigger)
		assert(trigger.has_signal("on_deactivated"), "Trigger has no \"on_deactivated\" signal: %s" % trigger)
		trigger.on_activated.connect(_on_trigger_changed)
		trigger.on_deactivated.connect(_on_trigger_changed)


func _on_trigger_changed() -> void:
	var new_ativation := false
	
	match(condition):
		TriggerCondition.ALL: new_ativation = triggers.all(_is_triggering)
		TriggerCondition.ANY: new_ativation = triggers.any(_is_triggering)
		TriggerCondition.ONE: new_ativation = triggers.filter(_is_triggering).size() == 1
	
	if new_ativation and !activated:
		activated = true
		get_parent().call_deferred("open")
	elif !new_ativation and activated:
		activated = false
		get_parent().call_deferred("close")


func _is_triggering(trigger) -> bool:
	return trigger.is_triggering
