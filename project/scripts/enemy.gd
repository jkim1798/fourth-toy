extends CharacterBody2D

var health = 3

const SPEED = 200.0

const BULLET_ORIGIN = Vector2(-16,0)

var stop_distance = 0

func _ready():
	stop_distance = randf_range(60, 120)
	velocity = Vector2(-20,0)
	
func _physics_process(delta):

	if position.x < stop_distance:
		velocity = Vector2()

	move_and_slide()


func hit():
	health -= 1
	if health <= 1:
		queue_free()


func _on_timer_timeout():
		get_parent().shoot(BULLET_ORIGIN + global_position, Vector2(-100,0))
