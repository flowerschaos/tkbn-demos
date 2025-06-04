extends Resource
class_name Skill

@export var name: String
@export var target: TARGET_TYPE
@export var does_damage: bool = false
@export var damage_amount: int
@export var has_cooldown: bool = false
@export var cooldown_timer: int
@export var is_passive: bool

enum TARGET_TYPE {ENEMIES,ALLIES}
