extends Node2D

var timer:float = 0.0
var count_timer:float = 0
var time_trigger:int = 2

var list_tokens:Array = []
var screen_size:Vector2 = Vector2()

var sprite_width = 32

func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta):
	if global.is_running:
		count_timer += delta
		if count_timer > time_trigger:
			build()
			count_timer = 0.0
			time_trigger = (randi() % 2) + 1
		update()

func build():
	var diff_x = screen_size.x + sprite_width*2
	var diff_y = screen_size.y - (sprite_width*3) 
	var tokens:Array = []
	randomize()
	var num = (randi() % global.num_box) + 1
#	print("num: "+str(num))
	for value in range(num):
		var obj = load("res://scenes/token.tscn").instance()
		obj.position = Vector2(diff_x, diff_y)
		obj.scale = Vector2(1, 1)
		diff_y -= sprite_width
		add_child(obj)
		tokens.push_back(obj)
		
	list_tokens.push_back(tokens)

func update():
	var indexs = []
	var index = 0
	for tokens in list_tokens:
		if tokens[0].position.x < -sprite_width:
			indexs.push_back(index)
	
	for i in indexs:
		for element in list_tokens[i]:
			element.queue_free()
		list_tokens.remove(i) 
	









