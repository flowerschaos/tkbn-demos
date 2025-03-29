extends Node
class_name CombatGridManager

var astar_grid = AStarGrid2D.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	astar_grid.region = Rect2i(0, 0, 32, 32)
	astar_grid.cell_size = Vector2(16, 16)
	astar_grid.update()
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_ONLY_IF_NO_OBSTACLES
	print(astar_grid.get_point_path(Vector2i(0, 0), Vector2i(3, 4)))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
