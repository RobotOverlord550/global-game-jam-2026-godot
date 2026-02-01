extends Camera2D


const follow_player_speed: float = 4


func _handle_player_following(delta: float) -> void:
	var distance = position.distance_to(References.player.position)
	if distance < 0.01:
		return
	
	var pos_x = position.x
	var pos_y = position.y
	var player_pos_x = References.player.position.x
	var player_pos_y = References.player.position.y
	var x_distance = abs(pos_x - player_pos_x)
	var y_distance = abs(pos_y - player_pos_y)
	
	position.x = move_toward(pos_x, player_pos_x, delta * follow_player_speed * x_distance)
	position.y = move_toward(pos_y, player_pos_y, delta * follow_player_speed * y_distance)


func _process(delta: float) -> void:
	_handle_player_following(delta)
