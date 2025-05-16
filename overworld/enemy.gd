extends CharacterBody3D

@onready var lock_on: MeshInstance3D = $LockOn

func _ready() -> void:
	add_to_group("enemy")
	set_selection(false)

func set_selection(boolean: bool):
	lock_on.visible = boolean
