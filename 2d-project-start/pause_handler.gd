extends Node

func toggle_pause() -> void:
	get_tree().paused = not get_tree().paused
	%Pause.visible = get_tree().paused
	if get_tree().paused:
		%ResumeButton.grab_focus()
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		toggle_pause()

func _on_resume_button_pressed() -> void:
	toggle_pause()

func _on_restart_button_pressed() -> void:
	toggle_pause()
	get_tree().reload_current_scene()
