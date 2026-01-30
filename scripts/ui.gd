extends CanvasLayer

@onready var score_label = $ScoreLabel
@onready var speed_label = $SpeedLabel
@onready var message_label = $MessageLabel
@onready var game_over_panel = $GameOverPanel
@onready var final_score = $GameOverPanel/VBoxContainer/FinalScore
@onready var restart_label = $GameOverPanel/VBoxContainer/RestartLabel

func update_score(value):
	score_label.text = "Score: " + str(value)

func update_speed(value):
	speed_label.text = "Speed: " + str(int(value)) + " m/s"

func show_message(text):
	message_label.text = text
	message_label.visible = true

func hide_message():
	message_label.visible = false

func show_game_over(final):
	game_over_panel.visible = true
	final_score.text = "Final Score: " + str(final)
	restart_label.visible = true

func hide_game_over():
	game_over_panel.visible = false
	restart_label.visible = false
