extends CharacterBody2D

signal health_depleted

var health = 100.0
const DAMAGE_RATE = 0.5

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600; # pixels per second?
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
	
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	
	if overlapping_mobs.size() > 0:
		health -= overlapping_mobs.size() * DAMAGE_RATE
		%HealthBar.value = health
		if health <= 0.0:
			health_depleted.emit()
