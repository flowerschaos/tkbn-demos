extends Node

@warning_ignore("unused_signal")
signal enter_combat

var char_selected: Player

func select_player(player):
	char_selected = player
