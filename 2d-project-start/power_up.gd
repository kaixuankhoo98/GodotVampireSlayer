extends Area2D
class_name PowerUp

signal collected

func action(player: Player):
	print("collected, to be overrided")

func _on_body_entered(body):
	if body is Player:
		action(body)
		collected.emit()
		queue_free()
