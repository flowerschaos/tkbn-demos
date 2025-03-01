extends Panel

@onready var hp: Label = $stats/hp
@onready var ap: Label = $stats/ap

func _on_ap_change(value: Variant) -> void:
	ap.text = "AP: "+str(value)

func _on_hp_change(value: Variant) -> void:
	hp.text = "HP: "+str(value)
