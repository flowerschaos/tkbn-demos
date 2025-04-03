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
		if is_edge(cell):
			pass
		else:
			for adjacent in get_adjacent_points(cell):
				astar.connect_points(astar.get_closest_point(cell), astar.get_closest_point(adjacent))

func is_edge(cell):
	if cell.x == 0 || cell.z == 0:
		return true
	elif cell.x == cells.size()-1 || cell.z == cells.size()-1:
		return true
	else:
		return false

func get_adjacent_points(point):
	return [point + Vector3i(1,0,0), point + Vector3i(0,1,0), point + Vector3i(0,0,1), point + Vector3i(-1,0,0), point + Vector3i(0,-1,0), point + Vector3i(0,0,-1)]
