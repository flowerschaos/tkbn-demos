extends Node
class_name InitiativeManager

@onready var actors: Array = get_tree().get_nodes_in_group("actor")
@onready var timeline: HBoxContainer = $"../ui container/combat ui/timeline"

func speed_sort(a, b):
	return a.speed > b.speed

func _ready() -> void:
	actors.sort_custom(speed_sort)

func _process(delta: float) -> void:
	pass
