extends Node2D

var vel_max = 300
var velocity = Vector2(vel_max, 0)
var collision = true

var cur_anima_left = ""
var prev_anima_left = ""

func _ready():
	var sfx = null
	if global.is_girl:
		sfx = load("res://sounds/girl.ogg")
	else:
		sfx = load("res://sounds/man.ogg")

	sfx.set_loop(true)
	$music.stream = sfx
	$music.bus = "music"
	$music.play(global.seek_song)

func _process(delta):
	global.seek_song = $music.get_playback_position()

func _physics_process(delta):
	player_left_movement(delta)
	animation_player_left()
	animation_player_right()
	update()

func update():
	if not collision:
		$gui/node.show()
	
func animation_player_right():
	if global.is_girl:
		if collision:
			$player_right/animation.play("idle_man")
		else:
			$player_right/animation.play("talk")
	else:
		$player_right/animation.play("idle")

func player_left_movement(delta):
	if collision:
		velocity.x += 150 * delta
		if global.is_girl:
			cur_anima_left = "run_andrea"
		else:
			cur_anima_left = "run"
	
	else:
		velocity.x = 0
		if global.is_girl:
			cur_anima_left = "idle_andrea"
		else:
			cur_anima_left = "talk"
	
	if velocity.x > vel_max: velocity.x = vel_max
#	print(velocity.x)
	velocity = $player_left.move_and_slide(velocity, Vector2(0, -1))

func animation_player_left():
	if cur_anima_left != prev_anima_left:
		$player_left/sprite/animation.play(cur_anima_left)
		prev_anima_left = cur_anima_left

func _on_target_body_entered(body):
	collision = false
