class_name PlayerActor
extends Node

@export var stats: CharacterStats

signal downed(downed_actor: Node3D)
signal ended_turn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stats.init_value = dicecheck.standard()+round(stats.endurance/2)+round(stats.strength/2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
