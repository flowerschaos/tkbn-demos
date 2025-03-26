extends Node3D
@onready var combat: Node3D = $Combat

func _ready() -> void:
	combat.hide()
