extends Button

func _ready():
	var button = Button.new()
	button.text = "go to combat"
	button.pressed.connect(_button_pressed)
	add_child(button)

func _button_pressed():
	get_tree().change_scene_to_file("uid://dfy3lybjr2o24")
