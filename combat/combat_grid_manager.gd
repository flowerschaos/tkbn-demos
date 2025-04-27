extends Node
class_name CombatGridManager

@onready var astar = AStar3D.new()
@onready var grid: GridMap = $CombatGrid
@onready var nodes = {}
func _ready() -> void:
	var cells = grid.get_used_cells()
	for cell in cells:
		var ind = astar.get_available_point_id()
		astar.add_point(ind, grid.map_to_local(Vector3i(cell.x, cell.y, cell.z)))
		nodes[v3_to_index(cell)] = ind
		for x in [-1, 0, 1]:
			for y in [-1, 0, 1]:
				for z in [-1, 0, 1]:
					var v3 = Vector3i(x, y, z)
					if v3 == Vector3i(0, 0, 0):
						continue
					if v3_to_index(v3 + cell) in nodes:
						var ind1 = nodes[v3_to_index(cell)]
						var ind2 = nodes[v3_to_index(cell + v3)]
						if !astar.are_points_connected(ind1, ind2):
							astar.connect_points(ind1, ind2, true)
	print(astar.get_id_path(1,23))
func v3_to_index(v3):
	return str(int(round(v3.x))) + "," + str(int(round(v3.y))) + "," + str(int(round(v3.z)))

func compass(start,end):
	var gm_start = v3_to_index(grid.local_to_map(start))
	var gm_end = v3_to_index(grid.local_to_map(end))
	var start_id = 0
	var end_id = 0
	if gm_start in nodes:
		start_id = nodes[gm_start]
	else:
		start_id = astar.get_closest_point(start)
	if gm_end in nodes:
		end_id = nodes[gm_end]
	else:
		end_id = astar.get_closest_point(end)
	return astar.get_point_path(start_id, end_id)
