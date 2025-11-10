extends Node2D

var coins = 0

func collect():
	coins += 1
	$CanvasLayer/ScoreLabel.text = "Монетки: " + str(coins)
	
	if coins >= 5:
		$CanvasLayer/WinLabel.visible = true
