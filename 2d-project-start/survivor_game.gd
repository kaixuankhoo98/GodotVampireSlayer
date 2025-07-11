extends Node2D

const MOB = preload("res://mob.tscn")

func _ready() -> void:
	spawn_mob()
	spawn_mob()
	spawn_mob()

func spawn_mob(): 
	var mob = MOB.instantiate()
	%SpawnPoints.progress_ratio = randf()
	mob.global_position = %SpawnPoints.global_position
	add_child(mob)


func _on_timer_timeout() -> void:
	spawn_mob()

# reduces the spawn timer every 5 seconds
func _on_spawn_timer_reduce_timer_timeout() -> void:
	if $Player/Path2D/SpawnPoints/SpawnTimer.wait_time > 0.5:
		$Player/Path2D/SpawnPoints/SpawnTimer.wait_time -= 0.1
