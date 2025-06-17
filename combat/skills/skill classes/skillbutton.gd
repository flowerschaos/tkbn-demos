extends Button

signal use_skill(used_skill: Skill)
@export var used_skill: Skill
func _on_pressed() -> void:
	use_skill.emit(used_skill)
