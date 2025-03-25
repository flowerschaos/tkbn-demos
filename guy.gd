extends Node3D
class_name guy

@export_range(1,10) var endurance: int = 5
@export_range(1,10) var agility: int = 5
@export var battle_icon: Texture
var initiative = dicecheck.standard()+round(endurance/2)+round(agility/2)
