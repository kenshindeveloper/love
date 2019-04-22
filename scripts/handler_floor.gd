extends Node2D

export (int) var size_floor = 14

var floors = []

var screen_size = Vector2()
var diff_width = 64
var velocity = Vector2()

func _ready():
	screen_size = get_viewport_rect().size

	var diff_x = 0
	var diff_y = screen_size.y - 44
	
	for num in range(size_floor):
		var obj = load("res://scenes/floor.tscn").instance()
		obj.position = Vector2(diff_x, diff_y)
		obj.scale = Vector2(3, 3)
		obj.z_index = 2
		add_child(obj)
		floors.push_back(obj)
		diff_x += diff_width

func _process(delta):
	var index = 0
	for token in floors:
		if token.position.x < -diff_width:
			if index > 0 and floors[index-1].position.x > 0:
				token.position.x = floors[index-1].position.x + diff_width
			else: 
				token.position.x = screen_size.x + (diff_width)
				
		index += 1






