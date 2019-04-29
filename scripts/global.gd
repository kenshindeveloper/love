extends Node

var velocity:int = 50
var velocity_base:int = 250 
var jump_speed:int = -600
var num_box:int = 3
var is_girl:bool = false
var pts:int = 299
var is_running:bool = true
var add_pts = 5
var game_end = false
var flag_end = false

var wait_time:int = 2
var count_time:float = 0
var is_wait = false
var level:int = 2
var seek_song = 0
var seek_song_main = 0

func _process(delta):
	if is_wait and not is_running:
		count_time += delta
		
		if count_time > wait_time:
			is_wait = false
			count_time = 0
		
	if game_end:
		if count_time < 4:
			count_time += delta
		elif not flag_end and count_time >= wait_time:
			flag_end = true
			get_tree().change_scene("res://levels/level_end.tscn")
	
	if not game_end: update()

func update():
	if pts >= 0 and pts < 100 and level == -1:
		print("level 0")
		level = 0
		
	elif pts > 100 and pts <= 200 and level == 0:
		print("level 1")
		velocity = 275
		level = 1
		num_box = 4
		jump_speed = -620
	
	elif pts > 200 and pts <= 300 and level == 1:
		print("level 2")
		velocity = 325
		level = 2
		jump_speed = -660
		num_box = 5
	
	elif pts > 300 and level == 2:
		print("terminando...")
		level = 3
		game_end = true
	

func reset():
	print("reset")
	pts = 0
	velocity = velocity_base
	num_box = 3
	game_end = false
	is_running = true
	jump_speed = -600
	count_time = 0
	level = -1
	is_wait = false
	flag_end = false
	seek_song = 0
	seek_song_main = 0
	  