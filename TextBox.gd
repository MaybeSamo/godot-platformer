extends CanvasLayer

const CHAR_READ_RATE = 0.03

onready var label = $MarginContainer/HBoxContainer/Label
onready var margin_container = $MarginContainer

enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY
var text_queue = []

func _ready():
	print("Starting state: State.READY")
	hide_textbox()

func _process(delta):
	match current_state:
		State.READY:
			if !text_queue.empty():
				show_textbox()
				display_text()
		State.READING:
			pass
		State.FINISHED:
			$DialogueSound.stop()
			if Input.is_action_pressed("key_z"):
				hide_textbox()
				change_state(State.READY)

func queue_text(next_text):
	text_queue.push_back(next_text)

func hide_textbox():
	label.text = ""
	margin_container.hide()
	$DialogueSound.stop()

func clear_text_queue():
	pass

func show_textbox():
	margin_container.show()

func display_text():
	$DialogueSound.play()
	var next_text = text_queue.pop_front()
	label.text = next_text
	label.percent_visible = 0.0
	change_state(State.READING)
	show_textbox()
	$Tween.interpolate_property(label, "percent_visible", 0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()

func _on_Tween_tween_all_completed():
	change_state(State.FINISHED)

func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			print("Change to: State.READY")
		State.READING:
			print("Change to: State.READING")
		State.FINISHED:
			print("Change to: State.FINISHED")
