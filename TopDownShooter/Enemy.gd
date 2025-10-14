extends CharacterBody2D

@export var move_speed = 200.0
@export var detection_range = 320.0
@export var player_name: String = "Player"
@export var hp = 30

@export_group("Combat")
@export var damage = 10
@export var damage_cooldown = 1.0


var player: Node2D = null
var can_see_player = false
var damage_timer = 0.0

func _ready():
	player = get_node("../Player")
	

func _physics_process(delta):
	if damage_timer > 0:
		damage_timer -= delta
	
	if player:
		can_see_player = check_player_visibility()
		
		if can_see_player:
			move_toward_player()
		else:
			velocity = Vector2.ZERO
	
	move_and_slide()
	check_player_collision()

func check_player_visibility() -> bool:
	if not player:
		return false
	
	var distance = global_position.distance_to(player.global_position)
	
	if distance > detection_range:
		return false
	
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(
		global_position,
		player.global_position
	)
	query.exclude = [self]
	
	var result = space_state.intersect_ray(query)
	
	if result.is_empty():
		return true
	
	if result.collider == player:
		return true
	
	return false

func move_toward_player():
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * move_speed
	rotation = direction.angle()

func check_player_collision():
	if damage_timer > 0:
		return
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() == player:
			if player.has_method("take_damage"):
				player.take_damage(damage)
				damage_timer = damage_cooldown
			break
