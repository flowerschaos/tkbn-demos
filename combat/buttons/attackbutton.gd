extends ActionButton

func _on_pressed():
	if enemy and player:
		enemy.take_damage(4)
		enemy.last_attacked_by = player
		player.ap -= 1
