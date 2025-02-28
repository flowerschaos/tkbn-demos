extends CharacterBody3D
class_name Enemy
@onready var player: CharacterBody3D = $"../player/controller"

signal player_touched

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("stop"):
		player_touched.emit()
