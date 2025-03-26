extends CheckButton
@onready var combat: Node3D = $"../Combat"

func _toggled(toggled_on: bool) -> void:
	combat.show()
