extends Area2D

var speed = 750

func _physics_process(delta):
	position += transform.x * speed * delta



func _on_body_entered(body):
	if body.is_in_group("enemy"):
		body.hp = body.hp - 1
		if body.hp <= 0:
			body.queue_free()
	queue_free()

func _on_timer_timeout():
	queue_free()
	
