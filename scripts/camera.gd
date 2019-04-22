extends Camera2D

var player = null

func _ready():
	player = get_parent().get_node("player")
	smoothing_enabled = true
	smoothing_speed = 5.5
	
	