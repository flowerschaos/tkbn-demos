extends Node3D
var combat_scene = preload("res://combat/combat.tscn")
var combat = combat_scene.instantiate()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	signals.connect("enter_combat", _on_combat_enter)

func _on_combat_enter():
	add_child(combat)
	combat.add_child($enemy)
	combat.add_child($player)
	print("combat started")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
