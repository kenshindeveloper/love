extends Node

var velocity:int = 50
var velocity_base:int = 250 
var jump_speed:int = -600
var num_box:int = 3
var is_girl:bool = true
var pts:int = 0
var is_running:bool = true
var add_pts = 5


var wait_time:int = 1
var count_time:float = 0
var is_wait = false

func _process(delta):
	if is_wait and not is_running:
		count_time += delta
		
		if count_time > wait_time:
			is_wait = false
			count_time = 0
	update()

func update():
	if pts > 100 and pts <= 200 and velocity != 275:
		velocity = 275 
		num_box = 4
		jump_speed = -620
	
	if pts > 200 and pts <= 300 and velocity != 300:
		velocity = 300
	
	if pts > 300 and pts <= 400 and velocity != 325:
		velocity = 325
		jump_speed = -660
		num_box = 5
	

func reset():
	pts = 0
	velocity = velocity_base
	num_box = 3
	jump_speed = -600
	  