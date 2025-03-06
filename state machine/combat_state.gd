extends State
class_name CombatState

func enter():
	player.is_player = false
	signals.enter_combat.emit()
