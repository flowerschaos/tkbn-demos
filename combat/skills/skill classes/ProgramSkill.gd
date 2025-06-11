extends SkillBase
class_name ProgramSkill

@export var ram_cost: int = 1
@export var target: TARGET_TYPE
@export var program_type: PROGRAM_TYPE

enum TARGET_TYPE {ENEMIES, ALLIES}
enum PROGRAM_TYPE {BREACH, NOISE, LOCKPICK}

# Breach - Make yourself known. Attack enemies indirectly.
# Noise - Mask yourself in the digital static. Focused on keeping the diver concealed.
# Lockpick - Break it open, but stay quiet. Taking control of objects or enemy cyberware.
