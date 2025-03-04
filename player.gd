extends CharacterBody3D
class_name Player

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
var max_ap: get = get_max_ap
@onready var ap = max_ap: set = set_ap
const SPEED = 5.0

signal hp_changed(value)
signal ap_changed(value)
signal end_turn

#region hp
func set_hp(value):
	hp = clamp(value, 0, max_hp)
	emit_signal("hp_changed", hp)
func get_max_hp():
	return(10+health+(endurance*2))
#endregion

#region ap
func set_ap(value):
	ap = clamp(value, 0, max_ap)
	emit_signal("ap_changed", ap)
	if ap == 0:
		emit_signal("end_turn")
func get_max_ap():
	return(round(1+(endurance/2)))
#endregion
