extends Node3D
const combat_path = preload("res://combat/combat.tscn")
var combat = combat_path.instantiate()
const main = preload("res://main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main.add_child(combat)
	combat.visible = false
	signals.connect("enter_combat", _on_combat_enter)

func _on_combat_enter():
	combat.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
