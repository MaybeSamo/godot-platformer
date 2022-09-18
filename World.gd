extends Node2D

func _on_Player_on_no_leave():
	$TextBox.clear_text_queue()
	print($TextBox.text_queue)
	$TextBox.queue_text("Hey dont leave just yet")
	$TextBox.queue_text("Also if you move your basically committing suicide..... unless you want that")
	print($TextBox.text_queue)

func _on_Player_dialogue_1():
	$TextBox.queue_text("See that slime over there.")
	$TextBox.queue_text("That would have been an enemy if the devoloper felt like coding it")
	$TextBox.queue_text("I'm looking at you MaybeSamo >=(")


func _on_Player_tutorial_1():
	$TextBox.queue_text("You can progress my dialogue with z")
	$TextBox.queue_text("Don't press z again if you want me to shut up")
	$TextBox.queue_text("You can crouch with the down arrow by the way")


func _on_Player_dialogue_2():
	$TextBox.queue_text("That pill doesnt seem scetchy at all")


func _on_Pill_pillEaten():
	$TextBox.queue_text("Bro you actually ate it......")
	$TextBox.queue_text("Try pressing space it may do something")
	$TextBox.queue_text("............")
	$TextBox.queue_text("........")
	$TextBox.queue_text("Your able to flip gravity btw")


func _on_Player_dialogue_3():
	$TextBox.queue_text("Dang it looks like thats all the developer wants there to be")
	$TextBox.queue_text("He might add more im not sure depending on if the people want more")
	$TextBox.queue_text("See you later?????")


func _on_Player_falldowndialogue():
	$TextBox.queue_text("Welcome to the endless void of the game")
	$TextBox.queue_text("I think the developer was just to lazy to add a game over screen")
	$TextBox.queue_text("Anyways have fun down here (restart your game to prevent inevitable boredom)")


func _on_Player_fallupdialogue():
	$TextBox.queue_text("Somethings telling me you have to flip your gravity when there is something to land on")
	$TextBox.queue_text("Just my personal opinion you can do what you want though")
	$TextBox.queue_text("(your supposed to flip your gravity when there is something you can land on)")


func _on_Player_endfalldialogue():
	$TextBox.queue_text("Welcome to the endless void but this time its at the end of the game.")
	$TextBox.queue_text("Im running out of dialogue ideas")


func _on_Player_endfalldialogue2():
	$TextBox.queue_text("Welcome to the endless void but this time its at the end of the game.")
	$TextBox.queue_text("AND your gravity flipped. If I wasn't lazy I would have added a space easter egg")
