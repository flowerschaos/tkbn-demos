extends ActionButton

func _on_pressed():
	if player:
		player.hp += 5
		player.ap -= 1
