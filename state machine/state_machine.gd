extends Node

@export var initial_state: State
var states: Dictionary = {}
var current_state: State

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.changed.connect(on_state_changed)
		if initial_state:
			initial_state.enter()
			current_state = initial_state

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func on_state_changed(state, new_state_name):
	var new_state = states.get(new_state_name)
	if state != current_state:
		return
	if !new_state:
		return
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state = new_state
