extends SkillBase
class_name ProgramSkill

@export var ram_cost: int = 1
@export var target: TARGET_TYPE
@export var program_type: PROGRAM_TYPE

enum TARGET_TYPE {ENEMIES,ALLIES}
enum PROGRAM_TYPE { NOISE, LOCKPICK}

# Noise - Mask yourself in the digital static. Focused on keeping the diver concealed.
# Lockpick - Break it open, by any means necessary. Taking control of objects or enemy cyberware.
