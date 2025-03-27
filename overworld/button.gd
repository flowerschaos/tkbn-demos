extends Button

signal combat_grab

func _pressed() -> void:
	combat_grab.emit()
