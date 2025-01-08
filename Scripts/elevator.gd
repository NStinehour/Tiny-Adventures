extends Node2D

# Movement speed and limits
const SPEED = 60.0
const UP_POSITION = Vector2(41, -500)  # Offset from starting position
const DOWN_POSITION = Vector2(41, 26)   # Starting position

var target_position: Vector2

func _ready():
	# Initialize the platform's starting position
	target_position = DOWN_POSITION
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		target_position = UP_POSITION
		print("entered")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		target_position = DOWN_POSITION 
		print("exited")


func _physics_process(delta: float) -> void:
	# Smoothly move the platform toward the target position
	position = position.move_toward(target_position, SPEED * delta)
