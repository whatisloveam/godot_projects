extends CharacterBody2D

@export var speed = 400
@export var jump_speed = -700
@export var g = 2000


func _physics_process(delta):
	velocity.y += g * delta # Добавляем силу падения на каждом кадре
	velocity.x = Input.get_axis("a", "d") * speed # движение вправо влево
	move_and_slide()
	# прыгаем на пробел если мы на земле
	if Input.is_action_just_pressed("ui_accept") and is_on_floor(): 
		velocity.y = jump_speed
		
	# Переключение анимаций
	if not is_on_floor(): # если игрок не на полу (прыгает...)
		$AnimatedSprite2D.play("jump")
	elif velocity.x > 0: # иначе если игрок движется вправо
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("run")
	elif velocity.x < 0: # иначе если игрок движется влево
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("run")
	else: # если ничего не делает
		$AnimatedSprite2D.play("idle")
