extends CharacterBody3D

const SPEED = 5.0

var can_move: bool = true
var enemiesInRange = []
var currentTarget
var selectionIndex = -1

#region movement and interaction
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if can_move == true:
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir := Input.get_vector("left", "right", "forward", "backward")
		var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
		move_and_slide()
func _on_interaction_component_item_found() -> void:
	pass
	#can_move = false
func _on_interaction_component_ended_interaction() -> void:
	can_move = true
#endregion

#region enemy target lock
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		_select_enemy()
func _select_enemy():
	if enemiesInRange.is_empty(): return
	_change_target_index()
	var target = enemiesInRange[selectionIndex]
	if target == currentTarget:
		_change_target_index()
		target = enemiesInRange[selectionIndex]
	_reset_selection()
	currentTarget = target
	target.set_selection(true)
func _change_target_index():
	if not currentTarget: 
		selectionIndex = 0
	else:
		selectionIndex += 1
	if selectionIndex > enemiesInRange.size() - 1:
		selectionIndex = 0
func _reset_selection():
	for enemy in enemiesInRange:
		enemy.set_selection(false)
func _on_lock_system_body_entered(body: Node3D) -> void:
	if body in get_tree().get_nodes_in_group("enemy"):
		enemiesInRange.append(body)
func _on_lock_system_body_exited(body: Node3D) -> void:
	if body in get_tree().get_nodes_in_group("enemy"):
		enemiesInRange.erase(body)
func _target_lock_off():
	var selectionIndex = -1
	currentTarget = null
#endregion
