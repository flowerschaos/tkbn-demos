extends Node
class_name InitManager

var actors: Array = get_tree().get_nodes_in_group("actor")
var actor_order: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
