extends CharacterBody3D
class_name Actor

@onready var lock_on: MeshInstance3D = $LockOn
@export var combat_alignment: alignment
@export_range(1,10) var endurance: int = 5
@export_range(1,10) var agility: int = 5
@export var battle_icon: Texture
var initiative = dicecheck.standard()+round(endurance/2)+round(agility/2)
enum alignment {ENEMY,PLAYER}
@export var skillset: Array[Skill]
func _ready() -> void:
	set_selection(false)
	_set_group()

func set_selection(boolean: bool):
	lock_on.visible = boolean

func _set_group():
	if combat_alignment == alignment.PLAYER:
		add_to_group("player")
	if combat_alignment == alignment.ENEMY:
		add_to_group("enemy")
