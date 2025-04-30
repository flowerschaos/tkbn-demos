extends CharacterBody3D

@export_range(1,10) var endurance: int = 5
@export_range(1,10) var agility: int = 5
@export var battle_icon: Texture
var initiative = dicecheck.standard()+round(endurance/2)+round(agility/2)

var path = []
var path_ind = 0
@onready var move_speed = endurance*2
@onready var astar: CombatGridManager = $"../AStarMap"

func _physics_process(delta):
	if path_ind < path.size():
		var move_vec = (path[path_ind] - global_transform.origin)
		if move_vec.length() < 0.1:
			path_ind += 1
		else:
			var equalize = move_vec.normalized() * move_speed
			velocity = equalize + Vector3(0, 1, 0)
			move_and_slide()
 
func move_to(target_pos):
	path = astar.compass(global_transform.origin, target_pos)
	path_ind = 0
