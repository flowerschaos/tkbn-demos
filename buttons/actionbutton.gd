extends Button
class_name ActionButton
@onready var main = get_tree().current_scene
@onready var enemy = main.get_node("enemy")
@onready var player = main.get_node("player")

func _on_pressed() -> void:
	if enemy and player:
		player.ap -= 1
