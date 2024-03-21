extends CharacterBody2D

signal shoot(pos: Vector2, vector: Vector2)

var health = 3

const SPEED = 200.0

const BULLET_ORIGIN = Vector2(16,0)

func _physics_process(delta):

	velocity.y = Input.get_axis("move_up","move_down") * SPEED
	if Input.is_action_just_pressed("click"):
		shoot.emit(BULLET_ORIGIN + global_position, Vector2(100,0))
	move_and_slide()



func hit():
	health -= 1
	if health <= 0:
		get_tree().call_deferred("reload_current_scene")
