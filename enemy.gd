extends Node3D

var hp = 25: set = set_hp
@onready var hp_label: Label3D = $"hp label"
@onready var player: Node3D = $"../player"

signal on_death
signal end_turn

func set_hp(new_hp):
	hp = new_hp
	hp_label.text = "hp: "+str(hp)

func attack(target):
	await get_tree().create_timer(0.4).timeout
	target.hp -= 4
	emit_signal("end_turn")

func take_damage(amount):
	self.hp -= amount
	if hp <= 0:
		queue_free()
		emit_signal("on_death")
