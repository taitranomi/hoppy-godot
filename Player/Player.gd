extends KinematicBody2D

var motion = Vector2(0,0)
const SPEED = 1000
const GRAVITY = 100
const UP = Vector2(0,-1)
const JUMP_SPEED = 2000

signal animate

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animating()
	move_and_slide(motion, UP)
	print(delta)

func apply_gravity():
	if not is_on_floor():
		motion.y += GRAVITY
	else:
		motion.y = 0
		
func jump():
	if Input.is_action_pressed("Jump") and is_on_floor():
		motion.y -= JUMP_SPEED
		
func move():
	if Input.is_action_pressed("Left") and not Input.is_action_pressed("Right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("Right") and not Input.is_action_pressed("Left"):
		motion.x = SPEED
	else:
		motion.x = 0
		
func animating():
	emit_signal("animate", motion)


