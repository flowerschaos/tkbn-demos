class_name dicecheck
extends Node

static func standard():
	var rollA = randi_range(1,6)
	var rollB = randi_range(1,6)
	var rollsult = rollA+rollB
	return rollsult

static func death():
	var roll = randi_range(1,10)
	return roll
