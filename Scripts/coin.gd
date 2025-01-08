extends Area2D
@onready var game_manager: Node = %GameManager
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var pickup: AudioStreamPlayer2D = $Pickup
var picked_up = false

func _on_body_entered(_body: Node2D) -> void:
	animated_sprite_2d.visible = false
	#collision_shape_2d.disabled = true
	if not picked_up:
		pickup.play()
		game_manager.add_point()
		print("Got a coin!")
	picked_up = true
	await get_tree().create_timer(0.5).timeout
	queue_free()
