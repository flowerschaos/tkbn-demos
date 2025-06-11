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

@onready var command_menu: VBoxContainer = $ui/PanelContainer/CommandMenu
const timeline_panel = preload("uid://txjkilfd8uis")
@onready var initiative_visualizer: HBoxContainer = $ui/InitiativeVisualizer
@onready var program_skills: VBoxContainer = $ui/PanelContainer/CommandMenu/ProgramSkills
@onready var radioactive_skills: VBoxContainer = $ui/PanelContainer/CommandMenu/RadioactiveSkills

const skill_button = preload("uid://d0haf4p85f17o")
var loaded_programs = []
var loaded_radskills = []

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
	for things in program_skills.get_children():
		things.queue_free()
	for things in radioactive_skills.get_children():
		things.queue_free()
	loaded_programs.clear()
	loaded_radskills.clear()
	print("it is " + actor.name + "'s turn.")
	if actor.combat_alignment == actor.alignment.ENEMY:
		command_menu.hide()
	if actor.combat_alignment == actor.alignment.PLAYER:
		command_menu.show()
	program_skills.hide()
	radioactive_skills.hide()

	for program in actor.programs:
		var program_button = skill_button.instantiate()
		program_button.text = program.skill_name
		program_skills.add_child(program_button)
		loaded_programs.append(program_button)
		
	for rad_skill in actor.rad_skills:
		var rad_button = skill_button.instantiate()
		rad_button.text = rad_skill.skill_name
		radioactive_skills.add_child(rad_button)
		loaded_radskills.append(rad_button)

func _on_rad_skill_button_pressed() -> void:
	radioactive_skills.show()
	program_skills.hide()

func _on_program_skill_button_pressed() -> void:
	radioactive_skills.hide()
	program_skills.show()
