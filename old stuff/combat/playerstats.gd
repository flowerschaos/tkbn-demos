extends HBoxContainer

@onready var hp_label: Label = $hp
@onready var ap_label: Label = $ap

#func _ready() -> void:
	#for node in get_tree().get_nodes_in_group(&"player"):
		#node.ap_changed.connect(_on_ap_changed)
		#get_tree().call_group("player", connect("ap_changed", _on_ap_changed))

func _on_ap_changed(value: Variant) -> void:
	ap_label.text = "ap: "+str(value)

func _on_hp_changed(value: Variant) -> void:
	hp_label.text = "hp: "+str(value)
