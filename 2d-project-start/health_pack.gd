extends PowerUp
	
func action(player: Player):
	player.health += 20.0
	player.update_health_bar()
