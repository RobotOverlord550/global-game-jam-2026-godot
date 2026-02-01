extends Node

const movement_deadzone: float = 0.1

var movement_vector: Vector2


enum input_directions {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

@onready var input_dir = -1


func _process(delta: float) -> void:
	movement_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down", movement_deadzone)
	
	if Input.is_action_pressed("move_left"):
		input_dir = input_directions.LEFT
	elif Input.is_action_pressed("move_right"):
		input_dir = input_directions.RIGHT
	elif Input.is_action_pressed("move_up"):
		input_dir = input_directions.UP
	elif Input.is_action_pressed("move_down"):
		input_dir = input_directions.DOWN
	else:
		input_dir = -1
		
