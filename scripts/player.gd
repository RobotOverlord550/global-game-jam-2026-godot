class_name Player
extends CharacterBody2D


const movement_speed: float = 300

var mask: int = 0


func _handle_input(delta: float) -> void:
	velocity = InputManager.movement_vector.normalized() * movement_speed


func _ready() -> void:
	References.player = self


func _process(delta: float) -> void:
	_handle_input(delta)
	
	move_and_slide()
	
