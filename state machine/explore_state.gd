extends State
class_name ExploreState

@onready var ambush_area: Area3D = $"../../AmbushArea"
@onready var attack_prompt: Label = $"../../attack_prompt"

func enter():
	attack_prompt.visible = false
	print("entered explore state")

func physics_update(_delta: float):
	for body in ambush_area.get_overlapping_bodies():
		if body.collision_layer == 2:
			attack_prompt.visible = true
			body.add_to_group("actor")
			if Input.is_action_pressed("ui_accept"):
				changed.emit(self, "CombatState")
		else:
			attack_prompt.visible = false
			body.remove_from_group("actor")
