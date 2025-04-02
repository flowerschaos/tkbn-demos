extends Node
class_name CombatGridManager

var astar = AStar3D.new()
@onready var combat_grid: GridMap = $CombatGrid

func _ready() -> void:
	grid_setup()

func grid_setup():
	var id = 0
	var index = combat_grid.local_to_map(Vector3(0,0,0))
	#for cell in combat_grid.get_used_cells():
		#astar.add_point(id,index)
		#astar.connect_points(id,id+1)
		#id += 1
		#print(astar.get_id_path(1,2))
