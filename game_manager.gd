extends Node3D

@onready var combat_ui: Control = $"combat ui"
@onready var explore_ui: Control = $"explore ui"
@onready var enemy: Node3D = $enemy
@onready var player: Node3D = $player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	combat_ui.hide()
	explore_ui.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_enemy_touched() -> void:
	combat_ui.show()
	explore_ui.hide()
	get_tree().paused = true
	print("time to kick some teeth in")

func _on_attack_pressed() -> void:
	if enemy != null:
		enemy.hp -= 4

func _on_enemy_died() -> void:
	combat_ui.hide()
	explore_ui.show()
	get_tree().paused = false
	enemy = null
