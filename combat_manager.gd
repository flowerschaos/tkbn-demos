extends Node3D
class_name CombatOverseer

@onready var player_actions: HBoxContainer = $"player ui/player actions"
@onready var attack: Button = $"player ui/player actions/attack"
@onready var turn_skip: Button = $"player ui/player actions/turn_skip"
@onready var battle_end: Panel = $"player ui/battle_end"
@onready var battle_end_text: RichTextLabel = $"player ui/battle_end/battle_end_text"
@onready var init_manager: InitManager = $InitManager

var actors = init_manager.sorted_actors

func _ready() -> void:
	print(actors)
	turn_skip.pressed.connect(_next_turn)
	attack.pressed.connect(_show_target_buttons)

func _next_turn():
	pass
func _show_target_buttons():
	pass
