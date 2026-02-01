class_name PlayerSprite

extends AnimatedSprite2D


enum directions {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

@onready var _walking: bool = false
@onready var _direction = directions.RIGHT
var _animation_changed: bool = false 

func set_walking(walking: bool):
	if walking != _walking:
		_animation_changed = true
		_walking = walking


func set_direction(direction: directions):
	if direction != _direction:
		_animation_changed = true
		_direction = direction


func _handle_animations():
	if !_animation_changed:
		return
	
	flip_h = false
	if _walking:
		match _direction:
			0:
				play("up_walk")
				return;
			1:
				play("down_walk")
				return;
			2:
				flip_h = true
				play("horizontal_walk")
				return;
			3:
				play("horizontal_walk")
				return;
	else:
		match _direction:
			0:
				play("up_idle")
				return;
			1:
				play("down_idle")
				return;
			2:
				flip_h = true
				play("horizontal_idle")
				return;
			3:
				play("horizontal_idle")
				return;


func _process(delta: float) -> void:
	_handle_animations()
