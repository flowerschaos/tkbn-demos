extends Node3D

@onready var curr_turn = InitiativeManager.actors[cti]
var cti: int

signal combat_start

func _ready() -> void:
	cti = 0
	print(curr_turn)
	combat_start.emit()

func _on_turnswitch_pressed() -> void:
	if cti < (InitiativeManager.actors.size()-1):
		cti += 1
		curr_turn = InitiativeManager.actors[cti]
	else:
		cti = 0
		curr_turn = InitiativeManager.actors[0]
	
	print(curr_turn)
