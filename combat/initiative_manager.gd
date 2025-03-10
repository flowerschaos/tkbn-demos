extends Node

@onready var actors: Array = get_tree().get_nodes_in_group("actor")
var turn_order: Array = []
@onready var timeline: HBoxContainer = $"../ui container/combat ui/timeline"

signal end_turn

func speed_sort(a, b):
	return a.speed > b.speed

func _ready() -> void:
	end_turn.connect(_on_turn_end())
	actors.sort_custom(speed_sort)
	turn_order = actors.duplicate()

func _process(delta: float) -> void:
	pass

func _on_turn_end():
	var current_actor = turn_order.pop_front()
