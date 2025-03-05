extends State
class_name PlayerState

var player: Player

func enter():
	bind_player()

func bind_player():
	player = get_parent().get_parent()
