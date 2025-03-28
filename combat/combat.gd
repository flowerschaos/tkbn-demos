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
	combat_start.emit()
	actors.sort_custom(_sort_init)

func _on_turnswitch_pressed() -> void:
	if cti < (actors.size()-1):
		cti += 1
		curr_turn = actors[cti]
	else:
		cti = 0
		curr_turn = actors[0]
	initiative_visualizer.move_child(initiative_visualizer.get_child(0),actors.size())

func _sort_init(a,b):
	return a.initiative > b.initiative

func _on_combat_start() -> void:
	for actor in actors:
		var actor_frame = timeline_panel.instantiate()
		actor_frame.icon.texture = actor.battle_icon
		initiative_visualizer.add_child(actor_frame)
