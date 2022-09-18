extends Area2D

var hasPillEaten = false
signal pillEaten

func _on_Pill_body_entered(body):
	if !hasPillEaten:
		hasPillEaten = true
		$AudioStreamPlayer.play()
		emit_signal("pillEaten")
		hide()


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.flip_h
