extends Node3D

const COMBAT = preload("uid://jyt6sodbakhs")
var combat = COMBAT.instantiate()
@onready var button: Button = $Button
@onready var the_beast: CharacterBody3D = $"the beast"

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_button_combat_grab() -> void:
	add_child(combat)
	button.hide()
	the_beast.queue_free()
	
