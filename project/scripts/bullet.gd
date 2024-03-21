extends CharacterBody2D

var exploding = false

#var bounds = Rect2(0,0,240,160)

var normal = Vector2()
var explode_pos = Vector2()


func _physics_process(delta):
	if not exploding:
		var i = move_and_collide(velocity * delta)
		if i:
			collide(i)
		

func multiply():
	#for i in [PI * 5 / 4, PI * 3 / 4]:
	for i in [PI * 1 / 4, PI * -1 / 4]:
	
		var dir = velocity.normalized().rotated(i)
		dir = normal.rotated(i)
		#if bounds.has_point(global_position + dir * 16):
		get_parent().shoot(explode_pos + dir * 16, dir * velocity.length() * 0.75)
	queue_free()


func hit():
	queue_free()

func collide(collision: KinematicCollision2D):
	var obj = collision.get_collider()
	
	if obj.is_in_group("bullet"):
		obj.hit()
		hit()
	elif obj.is_in_group("target"):
		obj.hit()

		hit()
	elif obj.is_in_group("wall"):
		normal = collision.get_normal()
		explode_pos = collision.get_position()
		$AnimationPlayer.play("explode")
		exploding = true
