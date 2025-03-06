extends Node3D
@onready var combat_loc = preload("uid://ckg3nkg314bco")
var combat = combat_loc.instantiate()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	combat.visible = false
	signals.connect("enter_combat", _on_combat_enter)

func _on_combat_enter():
	combat.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
