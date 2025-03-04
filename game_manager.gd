extends Node
@onready var enemy: Node3D = $enemy
@onready var player: Node3D = $player
@onready var combat_ui: Control = $"combat ui"
@onready var playeractions: VBoxContainer = $"combat ui/actions"
@onready var playerstatpanel: PanelContainer = $"combat ui/playerstats"

func _ready() -> void:
	start_player_turn()
	print("player turn initiated")

func start_enemy_turn():
	playeractions.hide()
	if enemy:
		enemy.attack(player)
		print("player attacked")
		await enemy.end_turn
	start_player_turn()

func start_player_turn():
	playeractions.show()
	playerstatpanel.show()
	player.ap = player.max_ap
	await player.end_turn
	start_enemy_turn()

func _on_enemy_death() -> void:
	enemy = null
	print("enemy gone")
	combat_ui.hide()
