extends ShapeCast3D

func _process(delta: float) -> void:
	if is_colliding():
		print("HELLO???")
		for i in range(get_collision_count()):
			if get_collider(i).is_in_group("interactable"):
				print("HEY I HIT AN INTERACTABLE OBJECT")
