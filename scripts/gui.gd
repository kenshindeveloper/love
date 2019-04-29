extends Control

var cont_no_girlfriend = 0

func _ready():
	$node.hide()

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
	global.reset()
	get_tree().change_scene("res://levels/menu_0.tscn")


func _on_btn_yes_pressed():
	$node/label.text = "siiiiiiiiiii!"
	get_tree().change_scene("res://levels/end.tscn")


func _on_btn_no_pressed():
	if cont_no_girlfriend == 0:
		$node/label.text = "Amor, se mi novia"
	
	elif cont_no_girlfriend == 1:
		$node/label.text = "Como que no?...se mi novia"
	
	elif cont_no_girlfriend == 2:
		$node/label.text = "otra vez 'no', oye se mi novia"
	
	elif cont_no_girlfriend == 3:
		$node/label.text = "andaaaaaaaaaaa"
	
	elif cont_no_girlfriend == 4:
		$node/label.text = "nooooooooo, ese boton no me esta ayudando"
	
	elif cont_no_girlfriend == 5:
		$node/label.text = "'no'...ya se que es lo que hare...adios boton...quieres ser mi novia amor?"
		$node/btn_no.hide()
	
	elif cont_no_girlfriend == 6:
		$node/label.text = "amor quieres ser mi novia?"
	
	cont_no_girlfriend += 1
