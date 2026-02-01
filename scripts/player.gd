extends StaticBody2D


const movement_speed: float = 200


func _handle_input(delta: float) -> void:
	if InputManager.movement_vector:
		position += InputManager.movement_vector.normalized() * delta * movement_speed


func _ready() -> void:
	References.player = self


func _process(delta: float) -> void:
	_handle_input(delta)
