extends State
class_name ExploreState

@onready var ambush_area: Area3D = $"../../AmbushArea"
@onready var attack_prompt: Label = $"../../attack_prompt"

func enter():
	attack_prompt.visible = false
	print("entered explore state")

func physics_update(_delta: float):
	for body in ambush_area.get_overlapping_bodies():
		if body.name == "enemy":
			attack_prompt.visible = true
			if Input.is_action_pressed("ui_accept"):
				changed.emit(self, "CombatState")
