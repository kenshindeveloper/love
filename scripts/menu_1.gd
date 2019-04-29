extends Control

func _ready():
	$music.play(global.seek_song_main)

func _process(delta):
	global.seek_song_main = $music.get_playback_position()

func _on_male_pressed():
	global.is_girl = false
	get_tree().change_scene("res://levels/level_0.tscn")

func _on_female_pressed():
	global.is_girl = true
	get_tree().change_scene("res://levels/level_0.tscn")

func _on_back_pressed():
	get_tree().change_scene("res://levels/menu_0.tscn")
