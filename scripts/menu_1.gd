extends Control

func _on_male_pressed():
	global.is_girl = false
	get_tree().change_scene("res://levels/level_0.tscn")

func _on_female_pressed():
	global.is_girl = true
	get_tree().change_scene("res://levels/level_0.tscn")

func _on_back_pressed():
	get_tree().change_scene("res://levels/menu_0.tscn")
