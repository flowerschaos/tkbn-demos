extends Node
class_name InitManager


var players = []
var enemies = []
var sorted_actors = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	players = get_tree().get_nodes_in_group("player")
	enemies = get_tree().get_nodes_in_group("enemy")
	sorted_actors.append_array(players)
	sorted_actors.append_array(enemies)
	print(sorted_actors)

func _initiative_sort(a,b):
	if a.stats.init_value < b.stats.init_value:
		return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
