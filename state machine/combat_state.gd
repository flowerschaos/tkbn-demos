extends State
class_name CombatState

signal enter_combat

func enter():
	print("enter combat")
	emit_signal("enter_combat")
