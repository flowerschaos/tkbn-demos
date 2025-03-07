extends Node3D
class_name Enemy

var hp = 25: set = set_hp
@onready var hp_label: Label3D = $"HPLabel"

signal on_death
signal end_turn

#region turn based stuff
func set_hp(new_hp):
	hp = new_hp
	hp_label.text = "hp: "+str(hp)

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
