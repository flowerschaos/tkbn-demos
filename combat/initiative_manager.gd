extends Node
class_name InitiativeManager

@onready var active_character
@onready var actors: Array = get_tree().get_nodes_in_group("actor")

func speed_sort(a, b):
	if a.speed < b.speed:
		return true
	return false

func play_turn():
	await active_character.play_turn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	actors.sort_custom(speed_sort)
	print(actors)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
