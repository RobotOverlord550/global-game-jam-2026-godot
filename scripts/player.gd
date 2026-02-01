class_name Player
extends CharacterBody2D


const movement_speed: float = 300

var mask: int = 0

@onready var animatable_sprite:PlayerSprite = $Sprite


func _handle_input(delta: float) -> void:
	velocity = InputManager.movement_vector.normalized() * movement_speed
	if velocity != Vector2.ZERO:
		animatable_sprite.set_walking(true)
	else:
		animatable_sprite.set_walking(false)
	
	if InputManager.input_dir != -1:
		animatable_sprite.set_direction(InputManager.input_dir)


func _ready() -> void:
	References.player = self


func _process(delta: float) -> void:
	_handle_input(delta)
	
	move_and_slide()
	
