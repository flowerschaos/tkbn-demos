extends Node3D
class_name Combat

signal combat_start
signal combat_end
signal target_lock(target: Actor)

var curr_turn
var cti: int
var _combat_won: bool = false
var _time_moving: bool = true
var _player_controlled: bool = false

var actor = Actor
@onready var actors = get_tree().get_nodes_in_group("actor")
@onready var active_actor = actors[0]

const timeline_panel = preload("uid://txjkilfd8uis")
@onready var initiative_visualizer: HBoxContainer = $ui/InitiativeVisualizer

func _ready() -> void:
	curr_turn = actors[cti]
	cti = 0
	actors.sort_custom(_sort_init)
	for actor in actors:
		var actor_frame = timeline_panel.instantiate()
		actor_frame.icon.texture = actor.battle_icon
		initiative_visualizer.add_child(actor_frame)
	turn_commence(actors[cti])

func _on_turnswitch_pressed() -> void:
	if cti < (actors.size()-1):
		cti += 1
		curr_turn = actors[cti]
	else:
		cti = 0
		curr_turn = actors[0]
	initiative_visualizer.move_child(initiative_visualizer.get_child(0),actors.size())
	turn_commence(actors[cti])

func _sort_init(a,b):
	return a.initiative > b.initiative

func turn_commence(actor: Actor):
	print("it is " + actor.name + "'s turn.")
