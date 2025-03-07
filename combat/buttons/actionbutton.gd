extends Button
class_name ActionButton
@onready var player = get_tree().get_first_node_in_group("player")
@onready var enemy = get_tree().get_first_node_in_group("enemy")

func _on_pressed() -> void:
	if enemy and player:
		player.ap -= 1
