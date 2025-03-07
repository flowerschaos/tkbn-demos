extends Node3D
var combat_scene = preload("res://combat/combat.tscn")
var combat = combat_scene.instantiate()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	signals.connect("enter_combat", _on_combat_enter)

func _on_combat_enter():
	add_child(combat)
	var player = get_tree().get_first_node_in_group("player")
	var enemy = get_tree().get_first_node_in_group("enemy")
	player.reparent(combat)
	enemy.reparent(combat)
	print("combat started")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
