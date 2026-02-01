extends CharacterBody2D


const movement_speed: float = 180
const view_distance: float = 500
const player_repulsion_distance: float = 160
const player_repulsion_range: float = 0.2

@export var mask: int = 0


func player_visible() -> bool:
	var player = References.player
	var masks_match = player.mask == mask
	var within_view_distance = position.distance_to(player.position) < view_distance
	
	if within_view_distance and not masks_match:
		return true
	else:
		return false


func _handle_player_chase() -> void:
	if not player_visible():
		velocity = Vector2.ZERO
		return
	
	var player_pos = References.player.position	
	var distance_to_player = position.distance_to(player_pos)
	if player_repulsion_distance - player_repulsion_range < distance_to_player and distance_to_player < player_repulsion_distance + player_repulsion_range:
		velocity = Vector2.ZERO
	elif distance_to_player < player_repulsion_distance:
		velocity = distance_to_player / player_repulsion_distance * (position - player_pos).normalized()
		get_tree().quit()
	else:
		velocity = position.direction_to(player_pos)
	
	velocity *= movement_speed



func _process(delta: float) -> void:
	_handle_player_chase()
	move_and_slide()
