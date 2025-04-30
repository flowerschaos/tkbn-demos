extends Node3D
class_name Combat

var actors: Array = []
var curr_turn
var cti: int

const timeline_panel = preload("uid://txjkilfd8uis")
@onready var initiative_visualizer: HBoxContainer = $ui/InitiativeVisualizer

signal combat_start
signal combat_end

func _ready() -> void:
	actors = get_tree().get_nodes_in_group("actor")
	curr_turn = actors[cti]
	cti = 0
	actors.sort_custom(_sort_init)
	for actor in actors:
		var actor_frame = timeline_panel.instantiate()
		actor_frame.icon.texture = actor.battle_icon
		initiative_visualizer.add_child(actor_frame)
	actors[0].add_to_group("units")

func _on_turnswitch_pressed() -> void:
	actors[0].remove_from_group("units")
	if cti < (actors.size()-1):
		cti += 1
		curr_turn = actors[cti]
	else:
		cti = 0
		curr_turn = actors[0]
	actors[0].add_to_group("units")
	initiative_visualizer.move_child(initiative_visualizer.get_child(0),actors.size())

func _sort_init(a,b):
	return a.initiative > b.initiative
