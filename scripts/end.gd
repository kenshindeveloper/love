extends Control

func _ready():
	var sfx = null
	if global.is_girl:
		sfx = load("res://sounds/girl.ogg")
	else:
		sfx = load("res://sounds/man.ogg")

	sfx.set_loop(true)
	$music.stream = sfx
	$music.bus = "music"
	$music.play(global.seek_song)

func _on_btn_back_pressed():
	global.reset()
	get_tree().change_scene("res://levels/menu_0.tscn")
