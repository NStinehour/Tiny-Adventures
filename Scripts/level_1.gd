extends Node2D
@onready var door: Area2D = $door
@onready var game_manager: Node = %GameManager
@onready var door_sfx: AudioStreamPlayer = %door_sfx

func _on_door_body_entered(_body: Node2D) -> void:
	if game_manager.got_all_coins():
		print("You got all coins!")
		door_sfx.play()
		await get_tree().create_timer(0.1).timeout
		door.open_door()
		await get_tree().create_timer(0.5).timeout
		var current_scene = get_tree().current_scene.scene_file_path
		var next_level_num = current_scene.to_int() + 1
		var next_level_path = "res://Levels/level_" + str(next_level_num) + ".tscn"
		get_tree().change_scene_to_file(next_level_path)
	else:
		print("Not enough coins")
		print(game_manager.score)
