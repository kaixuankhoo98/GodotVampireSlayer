extends Node2D

const MOB = preload("res://mob.tscn")

var score = 0

func _ready() -> void:
	spawn_mob()
	spawn_mob()
	spawn_mob()

func spawn_mob(): 
	var mob = MOB.instantiate()
	%SpawnPoints.progress_ratio = randf()
	mob.global_position = %SpawnPoints.global_position
	add_child(mob)
	mob.on_death.connect(_on_mob_death)


func _on_timer_timeout() -> void:
	spawn_mob()

# reduces the spawn timer every 5 seconds
func _on_spawn_timer_reduce_timer_timeout() -> void:
	if $Player/Path2D/SpawnPoints/SpawnTimer.wait_time > 0.5:
		$Player/Path2D/SpawnPoints/SpawnTimer.wait_time -= 0.1

func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true

func _on_mob_death(value: int) -> void: 
	score += value
	%ScoreValue.text = str(score)
