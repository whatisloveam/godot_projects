extends RigidBody2D

@export var engine_thrust = 500
@export var spin_thrust = 15000

var thrust = Vector2()
var rotation_dir = 0

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		thrust = -transform.y * engine_thrust
	else:
		thrust = Vector2()
	
	rotation_dir = 0
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1

func _physics_process(delta):
	apply_central_force(thrust)
	apply_torque(rotation_dir * spin_thrust)
