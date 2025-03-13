extends Node

@onready var actors: Array = get_tree().get_nodes_in_group("actor")
var turn_order: Array = []

signal end_turn
signal next_turn(character)

func speed_sort(a, b):
	return a.speed > b.speed

func _ready() -> void:
	end_turn.connect(_on_turn_end)
	actors.sort_custom(speed_sort)
	turn_order = actors.duplicate()

func _process(delta: float) -> void:
	pass

func _on_turn_end():
	var current_actor = turn_order.pop_front()
	turn_order.append(current_actor)
	var current_character = turn_order[0]
	emit_signal("next_turn", current_character)
