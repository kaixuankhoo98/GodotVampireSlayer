extends CharacterBody2D

class_name Player

signal health_depleted

var health = 100.0
const DAMAGE_RATE = 0.5

func update_health_bar() -> void:
	%HealthBar.value = health

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600; # pixels per second?
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
	
	var overlapping_mobs = %HurtBox.get_overlapping_bodies().filter(func(body: Node2D):
		return body.is_in_group("mobs")
	)
	
	var overlapping_powerups = %HurtBox.get_overlapping_areas().filter(func(result):
		return result is PowerUp
	)
	
	print(overlapping_powerups.size())
	#print("Overlapping areas: ", %HurtBox.get_overlapping_areas().map(func(a): return a.name))
	
	for power_up in overlapping_powerups:
		power_up.action(self)
	
	if overlapping_mobs.size() > 0:
		health -= overlapping_mobs.size() * DAMAGE_RATE
		update_health_bar()
		if health <= 0.0:
			health_depleted.emit()
