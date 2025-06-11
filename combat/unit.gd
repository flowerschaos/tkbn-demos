extends CharacterBody3D
class_name Actor

@onready var lock_on: MeshInstance3D = $LockOn
@export var combat_alignment: alignment
@export var level: int = 1
var potential
@export_range(1,10) var endurance: int = 5
@export_range(1,10) var agility: int = 5
@export_range(1,5) var radiation: int = 1
@export var battle_icon: Texture
var initiative = dicecheck.standard()+round(endurance/2)+round(agility/2)
enum alignment {ENEMY,PLAYER}

@export var programs: Array[ProgramSkill]
@export var rad_skills: Array[RadioactiveSkill]

func _ready() -> void:
	set_selection(false)
	_set_group()
	potential = level+radiation

func set_selection(boolean: bool):
	lock_on.visible = boolean

func _set_group():
	if combat_alignment == alignment.PLAYER:
		add_to_group("player")
	if combat_alignment == alignment.ENEMY:
		add_to_group("enemy")

func use_skill(skill: SkillBase, target: Array[Actor] = []):
	await skill.execute_skill(self, target)
