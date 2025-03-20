class_name EnemyActor
extends Node3D

@export var character_name: String
@export var battle_icon: Texture
@export var stats: CharacterStats
@export var is_holding_weapon: bool = false

@onready var targetbutton: Button = $Target
@onready var health_bar: ProgressBar = $HealthBar
var current_hp: int

signal be_selected(target: Node3D)
signal downed(downed_actor: Node3D)
signal deal_damage(amount: int)

func _ready() -> void:
	targetbutton.hide()
	current_hp = stats.max_hp
	targetbutton.pressed.connect(_on_target_button_pressed)
	_update_health_bar()

func _update_health_bar():
	health_bar.max_value = stats.max_hp
	health_bar.value = current_hp

func start_turn():
	await get_tree().create_timer(0.6).timeout
	deal_damage.emit(get_attack_damage())

func show_target_button():
	targetbutton.show()

func hide_target_button():
	targetbutton.hide()

func _on_target_button_pressed():
	be_selected.emit(self)

func get_attack_damage():
	if is_holding_weapon == false:
		return stats.strength*2

func change_health(amount:int):
	current_hp -= amount
	_update_health_bar()
	if current_hp <= 0:
		current_hp = 0
		downed.emit(self)
		queue_free()
