extends Area2D

const BULLET = preload("res://bullet.tscn")

func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies();
	if enemies_in_range.size() > 0: 
		var target_enemy: CharacterBody2D = enemies_in_range[0];
		look_at(target_enemy.global_position)

func shoot() :
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)


func _on_timer_timeout() -> void:
	shoot()
