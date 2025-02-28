extends CharacterBody3D
class_name Enemy
@export var stats: Resource
@onready var controller: CharacterBody3D = $"../../player/controller"

signal player_touched
signal died

var max_hp = 10+stats.health+(stats.endurance*2)
var hp = max_hp: set = set_hp
var max_ap = 1+(stats.endurance/2)
var ap = max_ap: set = set_ap

func set_hp(value):
	hp = min(value, max_hp)
	if hp <= 0:
		emit_signal("died")
		queue_free()
	else:
		controller.hp -= 4
func set_ap(value):
	ap = min(value, max_ap)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("stop"):
		player_touched.emit()
