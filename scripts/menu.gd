extends Node2D

@onready var background_music = $BackgroundMusic


func _on_play_button_button_up():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_reset_data_button_button_up():
	Data.points = [0, 0]
	Data.save_data()


func _on_background_music_finished():
	background_music.play()
