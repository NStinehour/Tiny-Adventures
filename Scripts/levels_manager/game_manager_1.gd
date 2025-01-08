extends Node

const MAX = 5
var score = 0
@onready var score_label: Label = $ScoreLabel

func add_point():
	score += 1
	score_label.text = "You collected " + str(score) + " coins."
	Global.gotten_coins += 1

func got_all_coins() -> bool:
	if score == MAX:
		return true
	else:
		return false
