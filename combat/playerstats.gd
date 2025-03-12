extends HBoxContainer

@onready var hp_label: Label = $hp
@onready var ap_label: Label = $ap

func _on_ap_changed(value: Variant) -> void:
	ap_label.text = "ap: "+str(value)

func _on_hp_changed(value: Variant) -> void:
	hp_label.text = "hp: "+str(value)
