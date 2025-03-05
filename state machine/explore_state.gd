extends PlayerState
class_name ExploreState

@onready var ambush_area: Area3D = $"../../AmbushArea"
#@onready var enemy: Enemy = $enemy

func enter():
	print("entered explore state")

func physics_update(_delta: float):
	for body in ambush_area.get_overlapping_bodies():
		if body.name == "enemy":
			print("ENEMY FOUND. ENGAGING LETHAL FORCE")
			pass
			#do enemy stuff
