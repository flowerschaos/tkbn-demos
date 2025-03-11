extends Node

@onready var actors = get_tree().get_nodes_in_group("actor")
@onready var combat_ui: Control = $"ui container/combat ui"
@onready var playeractions: VBoxContainer = $"combat ui/actions"
@onready var playerstatpanel: PanelContainer = $"combat ui/playerstats"
@onready var hp_label: Label = $"combat ui/playerstats/HBoxContainer/hp"
@onready var ap_label: Label = $"combat ui/playerstats/HBoxContainer/ap"
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
	elif character.is_in_group("enemy"):
		playercam.priority = 0
		enemycam.priority = 1
		playeractions.hide()
