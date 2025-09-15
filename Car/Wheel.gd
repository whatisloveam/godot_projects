extends RigidBody2D

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		apply_torque(-50000)
	if Input.is_action_pressed("ui_right"):
		apply_torque(50000)
