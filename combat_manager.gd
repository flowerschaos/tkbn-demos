extends Node3D
class_name CombatOverseer

@onready var player_actions: HBoxContainer = $"player ui/player actions"
@onready var attack: Button = $"player ui/player actions/attack"
@onready var turn_skip: Button = $"player ui/player actions/turn_skip"
@onready var battle_end: Panel = $"player ui/battle_end"
@onready var battle_end_text: RichTextLabel = $"player ui/battle_end/battle_end_text"

@onready var actors = InitManager.actors
@onready var players = InitManager.players
@onready var enemies = InitManager.enemies

var current_turn: Node3D
var current_turn_index: int

func _ready() -> void:
	player_actions.hide()
	battle_end_text.hide()
	turn_skip.pressed.connect(_next_turn)
	attack.pressed.connect(_show_target_buttons)
	for p in players:
		p.turn_end.connect(_next_turn)
		p.downed.connect(_on_player_death)
	for e in enemies:
		e.be_selected.connect(_attack_selected_enemy)
		e.downed.connect(_on_enemy_death)
		e.deal_damage.connect(_attack_selected)
	current_turn = InitManager.actors[current_turn_index]
	_update_turn()

func _next_turn():
	pass
func _show_target_buttons():
	pass
func _on_player_death():
	pass
func _attack_selected_enemy():
	pass
func _on_enemy_death():
	pass
func _attack_selected():
	pass
func _update_turn():
	if current_turn
