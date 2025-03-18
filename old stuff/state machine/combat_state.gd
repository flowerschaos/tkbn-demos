extends State
class_name CombatState

@onready var ambush_area: Area3D = $"../../AmbushArea"

func enter():
	player.ambush_area.visible = false
	player.is_player = false
	signals.enter_combat.emit()
