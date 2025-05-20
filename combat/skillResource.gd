extends Resource
class_name Skill

@export var name: String
@export var target: TARGET_TYPE
@export var type: SKILL_TYPE

enum TARGET_TYPE {ENEMIES,ALLIES}

enum SKILL_TYPE {PHYSICAL, RADIOACTIVE}

static func filter_type(type:SKILL_TYPE,array_element:Skill):
	if array_element.type == type:
		return true
	return false
