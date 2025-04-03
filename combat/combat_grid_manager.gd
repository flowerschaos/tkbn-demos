extends Node
class_name CombatGridManager

@onready var astar = AStar3D.new()
@onready var combat_grid: GridMap = $CombatGrid
@onready var id = 0
@onready var cells = combat_grid.get_used_cells()
@onready var index = cells[id]
func _ready() -> void:
	obtain_points()
	connect_points()
	astar.get_id_path(1,3)

func obtain_points():
	for cell in cells:
		astar.add_point(id,index)
		id += 1

func connect_points():
	for cell in cells:
		for adjacent in get_adjacent_points(cell):
			astar.connect_points(astar.get_closest_point(cell), astar.get_closest_point(adjacent))

func get_adjacent_points(point):
	return [point + Vector3(1,0,0), point + Vector3(0,1,0), point + Vector3(0,0,1), point + Vector3(-1,0,0), point + Vector3(0,-1,0), point + Vector3(0,0,-1)]
