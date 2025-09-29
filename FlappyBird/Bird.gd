extends CharacterBody2D

var angle = 0

func _physics_process(delta):
	if $"..".started:
		velocity.y += 20
		angle += 3
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = -300
			angle = -90
		move_and_slide()
		rotation_degrees = angle
	else:
		if Input.is_action_just_pressed("ui_accept"):
			$"../StartGameLabel".visible = false
			$"..".started = true


func _on_area_2d_body_entered(body):
	get_tree().reload_current_scene()
