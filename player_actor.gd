class_name PlayerActor
extends Node

@export var character_name: String
@export var battle_icon: Texture
@export var stats: CharacterStats
@onready var health_bar: ProgressBar = $HealthBar
@export var is_holding_weapon: bool = false

var current_hp: int
var init_value = dicecheck.standard()+round(stats.endurance/2)+round(stats.agility/2)

signal downed(downed_actor: Node3D)
signal turn_end

func _ready() -> void:
	current_hp = stats.max_hp
	_update_health_bar()

func _update_health_bar():
	health_bar.max_value = stats.max_hp
	health_bar.value = current_hp

func attack(target: Node3D):
	await get_tree().create_timer(0.6).timeout
	target.take_damage(get_attack_damage())
	await get_tree().create_timer(0.1).timeout
	turn_end.emit()

func get_attack_damage():
	if is_holding_weapon == false:
		return stats.strength*2

func take_damage(amount:int):
	current_hp -= amount
	_update_health_bar()
	if current_hp <= 0:
		current_hp = 0
		downed.emit(self)
		queue_free()
