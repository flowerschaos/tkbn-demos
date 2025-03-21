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
	battle_end.hide()
	turn_skip.pressed.connect(_next_turn)
	attack.pressed.connect(_show_target_buttons)
	for p in players:
		p.turn_end.connect(_next_turn)
		p.downed.connect(_on_player_down)
	for e in enemies:
		e.be_selected.connect(_attack_selected_enemy)
		e.downed.connect(_on_enemy_down)
		e.deal_damage.connect(_attack_selected)
	current_turn = InitManager.actors[current_turn_index]
	_update_turn()

func _next_turn():
	if player_actions.visible:
		player_actions.hide()
	current_turn.stop_turn()
	if _check_for_battle_end() == false:
		current_turn_index = current_turn_index+1%actors.size()
		current_turn = actors[current_turn_index]
		_update_turn()
func _show_target_buttons():
	player_actions.hide()
	for e in enemies:
		e.show_target_button()
func _hide_target_buttons():
	for e in enemies:
		e.hide_target_button()

func _attack_selected_enemy(target:Node3D):
	_hide_target_buttons()
	current_turn.attack(target)

func _on_enemy_down(down_actor:Node3D):
	enemies.erase(down_actor)
	actors.erase(down_actor)
func _on_player_down(down_actor:Node3D):
	players.erase(down_actor)
	actors.erase(down_actor)

func _attack_selected(damage:int):
	var rand = randi_range(0, players.size()-1)
	players[rand].take_damage(damage)
	await get_tree().create_timer(0.1).timeout
	_next_turn()

func _check_for_battle_end()->bool:
	if enemies.is_empty():
		_show_battle_end_panel("you win!")
		return true
	elif players.is_empty():
		_show_battle_end_panel("you lose!")
		return true
	return false
func _update_turn():
	if current_turn.stats.type == CharacterStats.ActorType.PLAYER:
		player_actions.show()
	else:
		player_actions.hide()
	current_turn.start_turn()

func _show_battle_end_panel(text:String):
	battle_end_text.clear()
	battle_end_text.append_text("[center]%s"%[text])
	battle_end.show()
	if player_actions.visible:
		player_actions.hide()
