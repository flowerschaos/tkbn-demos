class_name EnemyActor
extends Node

@export var character_name: String
@export var battle_icon: Texture
@onready var health_bar: ProgressBar = $HealthBar
@export var is_holding_weapon: bool = false
enum ActorType {PLAYER, ENEMY}
@export var alignment: ActorType
@export_category("Statistics")
@export_category("Physical")
@export_range(1,10) var strength: int = 5
@export_range(1,10) var endurance: int = 5
@export_range(1,10) var agility: int = 5
@export_category("Mental")
@export_range(1,10) var knowledge: int = 5
@export_range(1,10) var insight: int = 5
@export_range(1,10) var chatter: int = 5
@export_category("Ability")
@export_range(1,10) var tech: int = 5
@export_range(1,10) var power: int = 5
var max_hp = 40+(strength*4)
@onready var targetbutton: Button = $Target
var current_hp: int
var init_value = dicecheck.standard()+round(endurance/2)+round(agility/2)

signal be_selected(target: Node3D)
signal downed(downed_actor: Node3D)
signal deal_damage(amount: int)

func _ready() -> void:
	targetbutton.hide()
	current_hp = max_hp
	targetbutton.pressed.connect(_on_target_button_pressed)
	_update_health_bar()

func _update_health_bar():
	health_bar.max_value = max_hp
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
		return strength*2

func change_health(amount:int):
	current_hp -= amount
	_update_health_bar()
	if current_hp <= 0:
		current_hp = 0
		downed.emit(self)
		queue_free()
