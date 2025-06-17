extends Node
class_name Skill

@export var skill_name: String = "Skill Name"
@export var skill_type: SKILL_TYPE
@export var skill_cost: int

enum SKILL_TYPE {SKILL, PROGRAM, RAD}

func execute(executor:Actor):
	pass
