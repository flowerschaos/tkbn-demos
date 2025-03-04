extends State
class_name ChaseState

@onready var enemy: Enemy = $"../.."
@onready var player: Player = $"../../../player"
var move_speed:= 5

signal combat_start

func enter():
	player.get_tree()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
