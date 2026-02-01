extends Camera2D


const follow_player_speed: float = 4


func _handle_player_following(delta: float) -> void:
	var distance = position.distance_to(References.player.position)
	if distance < 0.01:
		return
	
	var player_pos = References.player.position
	var x_distance = absf(position.x - player_pos.x)
	var y_distance = absf(position.y - player_pos.y)
	
	position.x = move_toward(position.x, player_pos.x, delta * follow_player_speed * x_distance)
	position.y = move_toward(position.y, player_pos.y, delta * follow_player_speed * y_distance)


func _process(delta: float) -> void:
	_handle_player_following(delta)
