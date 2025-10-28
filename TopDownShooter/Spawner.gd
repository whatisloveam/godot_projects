extends Sprite2D

@export var Enemy : PackedScene

func _on_timer_timeout():
	var enemy = Enemy.instantiate()
	owner.add_child(enemy)
	enemy.global_transform = global_transform
	enemy.hp = 1
