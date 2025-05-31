extends Control
class_name CommandMenu

signal command_selected(command: Resource)

@onready var attack: Button = $actions/attack
@onready var defend: Button = $actions/defend
@onready var skills: Button = $actions/skills
@onready var inventory: Button = $actions/inventory
@onready var tactics: Button = $actions/tactics
const ATTACK = preload("res://combat/command skills/attack.tres")
@onready var actions: VBoxContainer = $actions
@onready var skillsmenu: VBoxContainer = $skills
@onready var tacticsmenu: VBoxContainer = $tactics

const COMMANDBUTTON = preload("uid://c8dioh1qsu4xk")

var skillslist = []

func _ready() -> void:
	attack.pressed.connect(_on_command_pressed.bind(ATTACK))
	skills.pressed.connect(_on_skills_pressed.bind(ATTACK))
	tactics.pressed.connect(_on_tactics_pressed.bind(ATTACK))
	attack.grab_focus()
	_skill_menu_set()
	add_to_group("menuchaining")

func _on_command_pressed(command: Resource):
	hide()
	
	command_selected.emit(command)
	
	actions.show()
	skillsmenu.hide()
	tacticsmenu.hide()
	attack.grab_focus()

func _on_skills_pressed():
	actions.hide()
	skillsmenu.show()
	tacticsmenu.hide()
	skillsmenu.get_children()[0].grab_focus()

func _on_tactics_pressed():
	actions.hide()
	skillsmenu.hide()
	tacticsmenu.show()

func _skill_menu_set():
	for skill in skillslist:
		var newSkillButton = COMMANDBUTTON.instantiate()
		newSkillButton.text = skill.name
		newSkillButton.pressed.connect(_on_command_pressed.bind(skill))
		skillsmenu.add_child(newSkillButton)
