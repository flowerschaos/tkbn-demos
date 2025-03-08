extends Node
class_name InitiativeManager

@onready var actors: Array = get_tree().get_nodes_in_group("actor")

func speed_sort(a, b):
	return a.speed > b.speed

func _ready() -> void:
	actors.sort_custom(speed_sort)
	print(actors)

func _process(delta: float) -> void:
	pass
