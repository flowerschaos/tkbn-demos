extends Resource
class_name StartingStats

@export_category("Stats")
@export_range(1,10) var health
@export_range(1,10) var endurance
@export_range(1,10) var tech
@export_range(1,10) var power
@export_range(1,10) var speed
# STATS: health, endurance, tech, power, speed 
# each one goes to 10.
# attack and damage are dependant on what you're wearing.
# some calculations: ap = 5+(end/2)
# max hp = 10+hlt+(end*2), increases = (hlt/2)+2
