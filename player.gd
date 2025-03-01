extends CharacterBody3D

@export var stats: Resource: 
	set(value):
		stats = value
		max_hp = 10+stats.health+(stats.endurance*2)
		max_ap = 1+(stats.endurance/2)
@export var is_controller: bool

signal hp_change(value)
signal ap_change(value)
signal end_turn

var max_hp
var max_ap
var hp = max_hp: set = set_hp
var ap = max_ap: set = set_ap

const SPEED = 5.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if is_controller == true:
		if not is_on_floor():
			velocity += get_gravity() * delta
		var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
		var direction := (get_viewport().get_camera_3d().transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()

func set_hp(value):
	hp = min(value, max_hp)
	emit_signal("hp_change", hp)
func set_ap(value):
	ap = min(value, max_ap)
	emit_signal("ap_change", ap)
