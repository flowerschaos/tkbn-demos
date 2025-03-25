extends Node3D

@onready var turnswitch: Button = $turnswitch
var cti: int = 0
@onready var curr_turn = InitiativeManager.actors[cti]

func _ready() -> void:
	print(InitiativeManager.actors)

func _on_turnswitch_pressed() -> void:
	cti += 1
	print(curr_turn)
	if cti > InitiativeManager.actors.size():
		cti = 0
	curr_turn = InitiativeManager.actors[cti]
