extends HBoxContainer

const timeline_panel = preload("uid://txjkilfd8uis")

func _on_combat_combat_start() -> void:
	for child in get_children():
		child.queue_free()
	for actor in InitiativeManager.actors:
		var actor_frame = timeline_panel.instantiate()
		actor_frame.icon.texture = actor.battle_icon
		add_child(actor_frame)

func _on_turnswitch_pressed() -> void:
	move_child(get_child(0),InitiativeManager.actors.size())
