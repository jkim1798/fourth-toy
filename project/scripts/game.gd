extends Node2D
@export var bullet_scene: PackedScene
@export var enemy_scene: PackedScene


func shoot(pos: Vector2, vector: Vector2):
	var bullet = bullet_scene.instantiate()
	bullet.velocity = vector
	bullet.global_position = pos
	add_child(bullet)


func _on_timer_timeout():
	var enemy = enemy_scene.instantiate()
	enemy.global_position = Vector2(240, randf_range(8, 152))
	add_child(enemy)
