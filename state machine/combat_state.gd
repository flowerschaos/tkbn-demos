extends State
class_name CombatState

func enter():
	player.is_player = false
	signals.emit("enter_combat")
