extends Node

@onready var actors = get_tree().get_nodes_in_group("actor")
var enemyscript = load("uid://bn0ba0ldq4kho")
var playerscript = load("uid://cyim1le1kwvdp")
@onready var combat_ui: Control = $"ui container/combat ui"
@onready var playeractions: VBoxContainer = $"ui container/combat ui/actions"
@onready var timeline = load("uid://bwj8ohbhfsfq7")
@onready var playerstats: HBoxContainer = $"ui container/combat ui/playerstats"
@onready var playercam: PhantomCamera3D = $playercam
@onready var enemycam: PhantomCamera3D = $enemycam

func _ready() -> void:
	signals.connect("enter_combat", _on_combat_enter)
	InitiativeManager.next_turn.connect(_on_turn_switch)

func _on_combat_enter():	
	print("combat begin!")

func _on_turn_switch(character):
	if character.is_in_group("player"):
		playercam.priority = 1
		enemycam.priority = 0
		playeractions.show()
		playerscript.ap = playerscript.max_ap
	elif character.is_in_group("enemy"):
		playercam.priority = 0
		enemycam.priority = 1
		playeractions.hide()
		if enemyscript.last_attacked_by == Player:
			enemyscript.attack(enemyscript.last_attacked_by)
