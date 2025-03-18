extends Node
class_name State

signal changed

@export var player: Player

func enter():
	bind_player()

func bind_player():
	player = get_parent().get_parent()

func exit():
	pass
func update(_delta: float):
	pass
func physics_update(_delta: float):
	pass
