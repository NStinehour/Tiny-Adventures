extends Area2D
@onready var timer: Timer = $Timer
@onready var death_sound: AudioStreamPlayer2D = %DeathSound


func _on_body_entered(body: Node2D) -> void:
	print("You Died!") # Replace with function body.
	death_sound.play()
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	


func _on_timer_timeout() -> void:
	Global.gotten_coins = 0
	Engine.time_scale = 1
	get_tree().reload_current_scene()
