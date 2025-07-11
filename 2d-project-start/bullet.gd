extends Area2D

var travelled_distance = 0;

const SPEED = 2000;
const RANGE = 1200;

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation) # rotation propertyy from bullet
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	
	if travelled_distance > RANGE:
		queue_free() # destroy self


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
