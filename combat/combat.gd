extends Node3D
class_name Combat

@onready var actors: Array = get_tree().get_nodes_in_group("actor")
@onready var curr_turn = actors[cti]
var cti: int

static var current_combat

signal combat_start
signal combat_end

func _ready() -> void:
	cti = 0
	combat_start.emit()
	actors.sort_custom(_sort_init)
	await get_tree().create_timer(0.1).timeout

func _on_turnswitch_pressed() -> void:
	if cti < (actors.size()-1):
		cti += 1
		curr_turn = actors[cti]
	else:
		cti = 0
		curr_turn = actors[0]

func _sort_init(a,b):
	return a.initiative > b.initiative
