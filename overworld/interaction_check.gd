extends RayCast3D
# the interaction-checking raycast is simply a more advanced truffle-seeking hog

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if is_colliding():
		pass
