extends Resource
class_name CharacterStats

enum ActorType {PLAYER, ENEMY}

@export var InternalName: String
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
var max_hp = 10+strength
var init_value


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
