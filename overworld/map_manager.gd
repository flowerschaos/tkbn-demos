extends Node3D

const MAP_WIDTH: int = 10
const MAP_HEIGHT: int = 10
const REGION_SIZE: float = 2.0
const LOAD_AREA: int = 3

@export var player: CharacterBody3D

var _world_map = create_map( MAP_WIDTH, MAP_HEIGHT )
var _local_map = create_map( LOAD_AREA, LOAD_AREA )
var _world_center: Vector2i
var _trash_collector: Array[Node]
var displayTexture: Texture2D

var display: Array = create_map( LOAD_AREA, LOAD_AREA )

func _ready() -> void:
	load_world_map()
	_world_center = Vector2i(player.global_position.x, player.global_position.z)
	_local_map = load_local_map(_world_center)

func _process(delta: float) -> void:
	update_position(player.global_position)

func get_world(v: Vector3) -> String:
	var x = get_relative_x(v)
	var y = get_relative_y(v)
	return _world_map[x][y]
	
func update_position(v: Vector3) -> void:
	var new_center: Vector2i = get_relative_pos(v)
	if new_center == _world_center: return
	if exceeds_world_bounds( new_center ): return
	
	# If the movement is greater than the area we have loaded, we need to unload all
	if (abs(new_center.x - _world_center.x) > LOAD_AREA) or (abs(new_center.y - _world_center.y) > LOAD_AREA):
		var _new_local = load_local_map(new_center)
		clear_local_map(_local_map)
		_local_map = _new_local
	else:
		move_local_map(new_center)
	
	_world_center = new_center
		
func exceeds_world_bounds(pos: Vector2i ) -> bool:
	if pos.x < 0 or pos.y < 0: return true
	if pos.x >= MAP_WIDTH or pos.y >= MAP_HEIGHT: return true
	return false

func load_local_map(new_center: Vector2i) -> Array:
	var new_map = create_map(LOAD_AREA, LOAD_AREA)
	
	for x in range(0, LOAD_AREA):
		for y in range(0, LOAD_AREA):
			var world_x = (new_center.x - floor(LOAD_AREA / 2)) + x
			var world_y = (new_center.y - floor(LOAD_AREA / 2)) + y
			
			new_map[x][y] = load_map_segment(world_x, world_y)
			
	return new_map	

func load_map_segment(world_x: int, world_y: int) -> Node3D:
	if exceeds_world_bounds(Vector2i(world_x, world_y)):
		return null
	
	var _map_segment: PackedScene = load(_world_map[world_x][world_y])
	var instance: Node3D = null
	
	if _map_segment != null:
		instance = _map_segment.instantiate()
		instance.global_position = Vector3(world_x * REGION_SIZE, 0, world_y * REGION_SIZE)
		add_child(instance)
	
	return instance
	

func move_local_map(new_center: Vector2i) -> void:
	var move_vector: Vector2i = new_center - _world_center
	var map: Array = create_map(LOAD_AREA, LOAD_AREA)
	
	for x in range(0, LOAD_AREA):
		for y in range(0, LOAD_AREA):
			var nX = x - move_vector.x
			var nY = y - move_vector.y
			
			if (nX < 0 or nX >= LOAD_AREA) or (nY < 0 or nY >= LOAD_AREA):
				_trash_collector.append(_local_map[x][y])
			else:
				map[nX][nY] = _local_map[x][y]
	
	for x in range(0, LOAD_AREA):
		for y in range(0, LOAD_AREA):
			var world_x = (new_center.x - floor(LOAD_AREA / 2)) + x
			var world_y = (new_center.y - floor(LOAD_AREA / 2)) + y
			
			if map[x][y] == null:
				map[x][y] = load_map_segment(world_x, world_y)
	
	clear_trash()
	_local_map = map

func clear_trash() -> void:
	for i in _trash_collector:
		if is_instance_valid(i): i.queue_free()
	_trash_collector.clear()

func clear_local_map(map: Array) -> void:
	for x in range(0,LOAD_AREA):
		for y in range(0, LOAD_AREA):
			_trash_collector.append(map[x][y])
	clear_trash()
	
func get_relative_x(v: Vector3) -> int:
	var x = int(v.x / REGION_SIZE)
	return x

func get_relative_y(v: Vector3) -> int:
	var y = int(v.z / REGION_SIZE)
	return y

func get_relative_pos(v: Vector3) -> Vector2i:
	var nV = Vector2i(v.x, v.z)
	nV.x /= REGION_SIZE
	nV.y /= REGION_SIZE
	return nV

func create_map(width: int, height: int) -> Array:
	var map: Array = []
	for x in range(width):
		var col: Array = []
		col.resize(height)
		map.append(col)
	return map

func load_world_map() -> void:
	var image: Image = Image.load_from_file("res://world_map.png")
	
	for x in range (0, MAP_WIDTH):
		for y in range(0, MAP_HEIGHT):
			var rgb: Color = image.get_pixel(x,y)

			if rgb.g == 1.0:
				_world_map[x][y] = "res://World/Green_Tile.tscn"
			elif rgb.b == 1.0:
				_world_map[x][y] = "res://World/Blue_Tile.tscn"
			elif rgb.r == 1.0:
				_world_map[x][y] = "res://World/Red_Tile.tscn"
			else:
				_world_map[x][y] = "res://World/Blank_Tile.tscn"

func update_grid() -> void:
	for x in range(0, LOAD_AREA):
		for y in range(0, LOAD_AREA):
			if is_instance_valid(_local_map[x][y]):
				display[x][y].texture = null
			else:
				display[x][y].texture = displayTexture
