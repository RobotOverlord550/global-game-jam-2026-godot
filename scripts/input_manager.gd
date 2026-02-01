extends Node

const movement_deadzone: float = 0.1

var movement_vector: Vector2


func _process(delta: float) -> void:
	movement_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down", movement_deadzone)
	
