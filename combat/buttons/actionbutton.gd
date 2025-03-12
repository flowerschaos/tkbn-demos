extends Button
class_name ActionButton
var enemy 
var player 

func _on_pressed() -> void:
	if enemy and player:
		player.ap -= 1
