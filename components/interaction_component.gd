extends ShapeCast3D

signal item_found
signal ended_interaction

func _process(delta: float) -> void:
	if is_colliding():
		var collider = get_collider(0)
		for i in range(get_collision_count()):
			if get_collider(i).is_in_group("interactable"):
				Dialogic.start("testbox")
				item_found.emit()

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	ended_interaction.emit()
