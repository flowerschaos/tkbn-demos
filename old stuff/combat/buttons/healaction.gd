extends ActionButton

func _on_pressed():
	var enemy = get_tree().get_first_node_in_group("enemy")
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.hp += 5
