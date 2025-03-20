extends Resource
class_name CharacterStats

enum ActorType {PLAYER, ENEMY}

@export var alignment: ActorType
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
var init_value

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init_value = dicecheck.standard()+round(endurance/2)+round(agility/2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
