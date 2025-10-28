extends CharacterBody2D

var jump_velocity = -1300.0 # сила прыжка
var g = 50 # сила гравитации
var target_rotation = 0.0 # угол поворота, в который необходимо встать
var speed = 600

func _physics_process(delta):
	velocity.x = speed # движемся вправо
	
	if not is_on_floor(): # если не на полу, то падаем
		velocity.y += g
	
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		target_rotation += deg_to_rad(90)
	
	move_and_slide() # обработка коллизий
	rotation = lerp_angle(rotation, target_rotation, 0.2) # поворот
