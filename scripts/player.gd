extends KinematicBody2D

var current_animation = ""
var prev_animation = ""

export (int) var run_speed = 100
export (int) var gravity = 1200

var velocity = Vector2(0, 0)
var jumping = false

func _physics_process(delta):
	movement(delta)
	animation()

func movement(delta):
	if is_on_floor():
		if not global.is_girl:
			current_animation = "run"
		else:
			current_animation = "run_andre"
			
	else:
		if not global.is_girl:
			current_animation = "jump"
		else:
			current_animation = "jump_andre"
	
	var jump = false
	if global.is_running:
		jump = Input.is_action_pressed("key_jump")
	
	if jump and is_on_floor():
		jumping = true
		velocity.y = global.jump_speed
		$sound.play()
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
func animation():
	if current_animation != prev_animation:
		$animation.play(current_animation)
		prev_animation = current_animation










