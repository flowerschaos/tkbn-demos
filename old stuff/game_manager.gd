extends Node3D
const combat_scene = preload("res://combat/combat.tscn")
var combat = combat_scene.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	signals.connect("enter_combat", _on_combat_enter)
	signals.connect("exit_combat", _on_combat_exit)

func _on_combat_enter():
	add_child(combat)
	for actor in get_tree().get_nodes_in_group("actor"):
		actor.reparent(combat)
	print("combat started")

func _on_combat_exit():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
