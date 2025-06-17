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

@onready var command_menu: PanelContainer = $ui/PanelContainer
const timeline_panel = preload("uid://txjkilfd8uis")
@onready var initiative_visualizer: HBoxContainer = $ui/InitiativeVisualizer
@onready var skills: VBoxContainer = $ui/PanelContainer/CommandMenu/RadioactiveSkills

const skill_button = preload("uid://d0haf4p85f17o")
var loaded_skills = []

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
	for skill in skills.get_children():
		skill.queue_free()
	loaded_skills.clear()
		
	print("it is " + actor.name + "'s turn.")
	
	if actor.combat_alignment == actor.alignment.ENEMY:
		command_menu.hide()
		
	if actor.combat_alignment == actor.alignment.PLAYER:
		command_menu.show()
		
	for skill in actor.skills:
		var skill_button = skill_button.instantiate()
		skill_button.text = skill.skill_name
		
		skills.add_child(skill_button)
		loaded_skills.append(skill_button)
		
		skill_button.action_go.connect(skill_execute.bind)

func skill_execute(skill: Skill):
	skill.execute(actors[cti])
