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
	pass

func _physics_process(delta:float):
	var space_state = get_world_3d().direct_space_state
