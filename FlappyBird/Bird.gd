extends CharacterBody2D

var angle = 0.0;

func _physics_process(delta):
	velocity.y += 20
	angle += 3
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = -300
		angle = -90
	move_and_slide()
	rotation_degrees = angle
