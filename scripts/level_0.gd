extends Node2D

func _ready():
	var sfx = null
	if global.is_girl:
		sfx = load("res://sounds/girl.ogg")
	else:
		sfx = load("res://sounds/man.ogg")
		
	sfx.set_loop(true)
	$music.stream = sfx
	$music.bus = "music"
	$music.play()
	global.velocity = global.velocity_base
	

func _process(delta):
	global.seek_song = $music.get_playback_position()
