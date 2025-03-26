extends HBoxContainer

const timeline_panel = preload("uid://txjkilfd8uis")

func _on_combat_combat_start() -> void:
	for actor in Combat.actors:
		var actor_frame = timeline_panel.instantiate()
		actor_frame.icon.texture = actor.battle_icon
		add_child(actor_frame)

func _on_turnswitch_pressed() -> void:
	move_child(get_child(0),Combat.actors.size())
