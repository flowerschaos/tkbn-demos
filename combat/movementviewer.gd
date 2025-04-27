extends Camera3D

const ray_length = 1000

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		var from = project_ray_origin(event.position)
		var to = from + project_ray_normal(event.position) * ray_length
		var space_state = get_world_3d().direct_space_state
		var query := PhysicsRayQueryParameters3D.create(from, to)
		var result := space_state.intersect_ray(query)
		if result:
			get_tree().call_group("units", "move_to", result.position)
