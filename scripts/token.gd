extends Area2D

var flag_collision:bool = false

func _physics_process(delta):
	position.x -= delta * global.velocity
	
	var cond = (get_parent().get_parent().get_node("player").position.x > position.x)
	if global.is_running and not flag_collision and cond:
		global.pts += global.add_pts
		flag_collision = true
	
	elif not global.is_running and not flag_collision and cond:
		flag_collision = true
		
func _on_token_body_entered(body):
	if global.is_running:
		$sound.play()
		global.reset()
		global.is_running = false
		global.is_wait = true
