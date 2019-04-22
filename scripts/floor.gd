extends StaticBody2D

var velocity = Vector2()

func _process(delta):
	movement(delta)
	
func movement(delta):
	move_local_x(delta * (-global.velocity))