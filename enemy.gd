extends Node3D
class_name Enemy

@export var actor_name: String
@export var battle_icon: Texture

#region stat setup
@export_range(1,10) var health: int = 5
@export_range(1,10) var speed: int = 5
@export_range(1,10) var power: int = 5
@export_range(1,10) var endurance: int = 5
@export_range(1,10) var social: int = 5
@export_range(1,10) var tech: int = 5
#endregion

var max_hp: get = get_max_hp
@onready var hp = max_hp: set = set_hp
@onready var hp_label: Label3D = $"HPLabel"

signal on_death
signal end_turn

var last_attacked_by

#region turn based stuff
func set_hp(value):
	hp = clamp(value, 0, max_hp)
	hp_label.text = "hp: "+str(hp)
func get_max_hp():
	return(10+health+(endurance*2))

func attack(target):
	await get_tree().create_timer(0.4).timeout
	target.hp -= 4
	print("target attacked")
	emit_signal("end_turn")

func take_damage(amount):
	self.hp -= amount
	if hp <= 0:
		queue_free()
		emit_signal("on_death")
#endregion

func _ready() -> void:
	hp_label.visible = false
	signals.connect("enter_combat", _on_combat_enter)

func _on_combat_enter():
	hp_label.visible = true
