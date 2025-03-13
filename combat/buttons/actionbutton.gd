extends Button
class_name ActionButton

func _on_pressed() -> void:
	var enemy = get_tree().get_first_node_in_group("enemy")
	var player = get_tree().get_first_node_in_group("player")
	if enemy and player:
		player.ap -= 1
