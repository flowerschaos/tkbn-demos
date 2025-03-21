extends Node

@onready var players = get_tree().get_nodes_in_group("player")
@onready var enemies = get_tree().get_nodes_in_group("enemy")
var actors = []

func summon_actors():
	actors.assign(players)
	actors.append_array(enemies)

func _sort_initiative(a, b):
	return a.init_value > b.init_value

func _ready() -> void:
	summon_actors()
	actors.sort_custom(_sort_initiative)
