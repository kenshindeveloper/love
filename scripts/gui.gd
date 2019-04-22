extends Control

#func _ready():
#	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta):
	if global.is_running:
		$game_over.hide()
	else:
		$game_over.show()
	
	var enter = Input.is_action_pressed("key_jump")
	
	if enter and not global.is_wait and not global.is_running:
		global.pts = 0
		global.is_running = true
	
	var diff = ""
	for i in range(0, 8-len(str(global.pts))):
		diff += "0"
	
	$panel/pts.text = diff+str(global.pts)


func _on_back_pressed():
	get_tree().change_scene("res://levels/menu_0.tscn")
