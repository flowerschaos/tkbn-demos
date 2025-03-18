extends Node
class_name Character

@export_range(1,10) var endurance: int = 5
var init_value

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func init_roll():
	var result_sum: int = Dice.roll(2, 6)
	init_value = result_sum

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
