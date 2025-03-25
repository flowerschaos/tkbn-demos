extends Node3D

@onready var turnswitch: Button = $turnswitch

@onready var curr_turn = InitiativeManager.actors[cti]
var cti: int

func _ready() -> void:
	cti = 0
	print(InitiativeManager.actors)
	print(curr_turn)

func _on_turnswitch_pressed() -> void:
	if cti < (InitiativeManager.actors.size()-1):
		cti += 1
		curr_turn = InitiativeManager.actors[cti]
	else:
		cti = 0
		curr_turn = InitiativeManager.actors[0]
	print(curr_turn)
