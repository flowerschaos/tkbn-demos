extends ActionButton

func _on_pressed():
	if enemy and player:
		enemy.take_damage(4)
		player.ap -= 1
