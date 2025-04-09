extends CharacterBody3D
@onready var guy: Actor = $".."

var path = []
var path_ind = 0
var move_speed = guy.endurance
@onready var astar = get_parent()
func _ready():
	add_to_group("current_selection")

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
