extends CharacterBody3D
class_name Player

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
var max_ap: get = get_max_ap
@onready var ap = max_ap: set = set_ap
@export var is_player: bool
@onready var ambush_area: Area3D = $AmbushArea
const move_speed = 5

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
	@warning_ignore("integer_division")
	return(round(1+(endurance/2)))
#endregion

func _physics_process(delta: float) -> void:
	if is_player == true:		
		if not is_on_floor():
			velocity += get_gravity() * delta
		var input_dir := Input.get_vector("left", "right", "forward", "backward")
		var direction := (get_viewport().get_camera_3d().transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * move_speed
			velocity.z = direction.z * move_speed
		else:
			velocity.x = move_toward(velocity.x, 0, move_speed)
			velocity.z = move_toward(velocity.z, 0, move_speed)
		move_and_slide()
