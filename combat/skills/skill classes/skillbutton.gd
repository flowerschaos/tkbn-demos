extends Button

signal action_go(action: Skill)
@export var action: Skill
func _on_pressed() -> void:
	action_go.emit(action)
