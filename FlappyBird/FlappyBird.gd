extends Node2D

var score = 0
var started = false

func _physics_process(delta):
	$ScoreLabel.text = "Score: " + str(score)
