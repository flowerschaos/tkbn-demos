extends Node3D
@onready var characters: Node3D = $Characters
@onready var enemies: Node3D = $Enemies

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	enemies.process_mode = PROCESS_MODE_ALWAYS
	characters.process_mode = PROCESS_MODE_ALWAYS
	var button = Button.new()
	button.text = "go to combat"
	button.pressed.connect(_button_pressed)
	add_child(button)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_combat_entered() -> void:
	pass

func _on_combat_exited() -> void:
	pass # Replace with function body.

func _button_pressed():
	get_tree().change_scene_to_file("uid://cpa6aewmdgg11")
