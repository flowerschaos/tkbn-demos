extends State
class_name ExploreState

@onready var ambush_area: Area3D = $"../../AmbushArea"
#@onready var enemy: Enemy = $enemy

func enter():
	print("entered explore state")

func physics_update(_delta: float):
	for body in ambush_area.get_overlapping_bodies():
		if body.name == "enemy":
			print("notorious scoundrel detected")
