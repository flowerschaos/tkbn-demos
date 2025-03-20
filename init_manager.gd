extends Node
class_name InitManager

var players = get_tree().get_nodes_in_group("player")
var enemies = get_tree().get_nodes_in_group("enemy")
var sorted_actors = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sorted_actors.append_array(players)
	sorted_actors.append_array(enemies)
	sorted_actors.sort_custom(_initiative_sort)

func _initiative_sort(actor1,actor2):
	if actor1.stats.init_value < actor2.stats.init_value:
		return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
