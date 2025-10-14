extends CharacterBody2D

@export var speed = 300.0
@export var Bullet : PackedScene
@export var hp = 100

func _physics_process(delta):
	var direction = Input.get_vector("a", "d", "w", "s")
	velocity = direction * speed
	move_and_slide()
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("click"):
		var bullet = Bullet.instantiate()
		owner.add_child(bullet)
		bullet.transform = $Marker2D.global_transform

func take_damage(amount):
	hp -= amount	
	modulate = Color.RED
	await get_tree().create_timer(0.1).timeout
	modulate = Color.WHITE
	print(hp)
	if hp <= 0:
		get_tree().reload_current_scene()
		
		
