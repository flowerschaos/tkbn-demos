extends Node
class_name SkillBase

@export var skill_name: String = "Skill Name"
@export var skill_desc: String = "The start of all things."
@export var does_damage: bool = false
@export var damage_amount: int
@export var is_passive: bool

func execute_skill(source: Actor, _target: Array[Actor] = []):
	await source.get_tree().process_frame
