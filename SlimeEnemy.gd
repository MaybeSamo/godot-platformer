extends KinematicBody2D

var speed = 200
var motion = Vector2()
var gravity = 20

var direction = 1

func _physics_process(delta):
	motion.y += gravity
	motion.x += speed * direction
	if is_on_wall():
		$AnimatedSprite.flip_h
		direction = direction * -1
	
	motion = move_and_slide(motion)
