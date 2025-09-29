extends StaticBody2D

func _physics_process(delta):
	if $"..".started:
		position += Vector2(-2, 0)
		if position.x < -40:
			position = Vector2(1200, randi_range(120,470))
			$"..".score += 1
