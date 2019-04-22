extends Control

func _on_new_game_pressed():
	get_tree().change_scene("res://levels/menu_1.tscn")

func _on_exit_pressed():
	get_tree().quit()
