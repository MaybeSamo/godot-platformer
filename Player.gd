extends KinematicBody2D

const UP = Vector2(0, -1)
var GRAVITY = 20
const MAXFALLSPEED = 300
const MAXSPEED = 200
const JUMPFORCE = 400
const ACCEL = 10

signal on_no_leave
signal tutorial_1
signal dialogue_1
signal dialogue_2
signal dialogue_3
signal falldowndialogue
signal fallupdialogue
signal endfalldialogue
signal endfalldialogue2

var tutorial1happened = false
var dialogue1happened = false
var dialogue2happened = false
var dialogue3happened = false
var falldowndialoguehappened = false
var fallupdialoguehappened = false
var endfalldialoguehappened = false
var endfalldialogue2happened = false

var motion = Vector2()
var canFlipGravity = false
var flipedGravity = false

func _physics_process(delta):
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	motion.x = clamp(motion.x,-MAXSPEED,MAXSPEED)
	
	#Movement
	if Input.is_action_pressed("ui_right"):
		motion.x += ACCEL		
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x -= ACCEL
		$AnimatedSprite.flip_h = true
	else:
		motion.x = lerp(motion.x,0,0.2)
	#Crouching
	if Input.is_action_just_pressed("ui_down"):
		$Tween.interpolate_property(self, "scale:y", 1, 0.5, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
	elif Input.is_action_just_released("ui_down"):
		$Tween.interpolate_property(self, "scale:y", 0.5, 1, 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMPFORCE
		if canFlipGravity and Input.is_action_just_pressed("space"):
			$AnimatedSprite.flip_v = true
			GRAVITY = GRAVITY - GRAVITY * 2
	
	if is_on_ceiling():
		if canFlipGravity and Input.is_action_just_released("space"):
			$AnimatedSprite.flip_v = false
			GRAVITY = GRAVITY + GRAVITY * -2
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMPFORCE
	
		
	motion = move_and_slide(motion,UP)


func _on_NoLeave_body_entered(body):
	emit_signal("on_no_leave")


func _on_Tutorial_1_body_entered(body):
	if !tutorial1happened:
		emit_signal("tutorial_1")
		tutorial1happened = true


func _on_Dialogue_1_body_entered(body):
	if !dialogue1happened:
		emit_signal("dialogue_1")
		dialogue1happened = true


func _on_Dialogue_2_body_entered(body):
	if !dialogue2happened:
		emit_signal("dialogue_2")
		dialogue2happened = true


func _on_Pill_pillEaten():
	canFlipGravity = true


func _on_Dialogue_3_body_entered(body):
	if !dialogue3happened:
		emit_signal("dialogue_3")
		dialogue2happened = true


func _on_FallDownDialogue_body_entered(body):
	if !falldowndialoguehappened:
		emit_signal("falldowndialogue")
		falldowndialoguehappened = true


func _on_FallUpDialogue_body_entered(body):
	if !fallupdialoguehappened:
		emit_signal("fallupdialogue")
		fallupdialoguehappened = true


func _on_EndFallDialogue_body_entered(body):
	if !endfalldialoguehappened:
		emit_signal("endfalldialogue")
		endfalldialoguehappened = true


func _on_EndFallDialogue2_body_entered(body):
	if !endfalldialogue2happened:
		emit_signal("endfalldialogue2")
		endfalldialogue2happened = true
