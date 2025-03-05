extends Node
@onready var player: Player = $player
@onready var enemy: Node3D = $enemy
@onready var combat_ui: Control = $"combat ui"
@onready var playeractions: VBoxContainer = $"combat ui/actions"
@onready var playerstatpanel: PanelContainer = $"combat ui/playerstats"
@onready var playercam: PhantomCamera3D = $playercam
@onready var enemycam: PhantomCamera3D = $enemycam

func _ready() -> void:
	signals.connect("enter_combat", _on_combat_enter)

func _on_combat_enter():
	print("combat begin!")
	turnorder()

func turnorder():
	pass

func start_enemy_turn():
	enemycam.priority = 1
	playercam.priority = 0
	playeractions.hide()
	if enemy:
		enemy.attack(player)
		print("player attacked")
		await enemy.end_turn
	start_player_turn()

func start_player_turn():
	enemycam.priority = 0
	playercam.priority = 1
	playeractions.show()
	playerstatpanel.show()
	player.ap = player.max_ap
	await player.end_turn
	start_enemy_turn()

func _on_enemy_death() -> void:
	enemy = null
	print("enemy gone")
