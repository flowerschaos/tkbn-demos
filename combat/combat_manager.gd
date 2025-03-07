extends Node
@onready var player = get_tree().get_first_node_in_group("player")
@onready var enemy = get_tree().get_first_node_in_group("enemy")
@onready var combat_ui: Control = $"combat ui"
@onready var playeractions: VBoxContainer = $"combat ui/actions"
@onready var playerstatpanel: PanelContainer = $"combat ui/playerstats"
@onready var hp_label: Label = $"combat ui/playerstats/HBoxContainer/hp"
@onready var ap_label: Label = $"combat ui/playerstats/HBoxContainer/ap"
@onready var playercam: PhantomCamera3D = $playercam
@onready var enemycam: PhantomCamera3D = $enemycam

func _ready() -> void:
	signals.connect("enter_combat", _on_combat_enter)
	player.connect("ap_changed", _on_ap_changed)
	player.connect("hp_changed", _on_hp_changed)

func _on_combat_enter():
	enemy.connect("on_death", _on_enemy_death)
	print("combat begin!")
	turnorder()

func turnorder():
	start_player_turn()

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

# handling ui
func _on_ap_changed(value: Variant) -> void:
	ap_label.text = "ap: "+str(value)
func _on_hp_changed(value: Variant) -> void:
	hp_label.text = "hp: "+str(value)
