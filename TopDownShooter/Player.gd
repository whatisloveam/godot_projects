extends CharacterBody2D

@export var speed = 300.0
@export var Bullet : PackedScene

func _physics_process(delta):
	var direction = Input.get_vector("a", "d", "w", "s")
	velocity = direction * speed
	move_and_slide()
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("click"):
		var bullet = Bullet.instantiate()
		add_child(bullet)
