extends Node
class_name InitiativeManager

@onready var active_character

func get_actors() -> Array:
	var actors
	actors = get_children()
	return actors

static func speed_sort(a, b):
	return a.speed > b.speed

func play_turn():
	await active_character.play_turn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
