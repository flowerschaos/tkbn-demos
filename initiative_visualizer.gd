extends HBoxContainer

const timeline_panel = preload("uid://txjkilfd8uis")

func _on_combat_turn_switch() -> void:
	for child in get_children():
		child.queue_free()
	for actor in InitiativeManager.actors:
		var actor_frame = timeline_panel.instantiate()
		actor_frame.icon.texture = actor.battle_icon
		add_child(actor_frame)
