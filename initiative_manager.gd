extends Node

@onready var actors: Array = get_tree().get_nodes_in_group("actor")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	actors.sort_custom(_sort_init)
	await get_tree().create_timer(0.1).timeout
	
func _sort_init(a,b):
	return a.initiative > b.initiative
