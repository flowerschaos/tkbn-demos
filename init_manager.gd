extends Node

var actors = []
var sorted_actors = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	actors = get_children()
	actors.sort_custom(_initiative_sort)
	actors = sorted_actors

func _initiative_sort(a,b):
	if a.stats.init_value < b.stats.init_value:
		return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
