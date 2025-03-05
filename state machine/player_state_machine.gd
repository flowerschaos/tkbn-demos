extends FSM
class_name PlayerStateMachine

@onready var player: CharacterBody3D = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.get_parent()
	initial_state = states.get("ExploreState")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
