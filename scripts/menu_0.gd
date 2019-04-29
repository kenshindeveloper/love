extends Control

func _ready():
	$music.play(global.seek_song_main)

func _process(delta):
	global.seek_song_main = $music.get_playback_position()

func _on_new_game_pressed():
	$music.play()
	get_tree().change_scene("res://levels/menu_1.tscn")

func _on_exit_pressed():
	get_tree().quit()
