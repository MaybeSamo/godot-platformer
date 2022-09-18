extends Node2D

func _ready():
	$Label3.hide()

func _on_Button_pressed():
	get_tree().change_scene("res://World.tscn")


func _on_Button3_pressed():
	$Label3.show()
	$Label.hide()
	$Label2.hide()
	$Button.hide()
	$Button2.hide()
	$Button3.hide()
	get_tree().quit()


func _on_Button2_pressed():
	get_tree().change_scene("res://Information.tscn")
