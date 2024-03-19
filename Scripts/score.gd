extends Control


@onready var score_label: Label = $MarginContainer/VBoxContainer/ScoreLabel
@onready var high_score_label: Label = $MarginContainer/VBoxContainer/HighScoreLabel


var score:= 0:
	set(new_score):
		score = new_score
		score_label.text = "Score: %d" %score
		if score > highScore:
			highScore = score
var highScore:= 0:
	set(new_high_score):
		highScore = new_high_score
		high_score_label.text = "High Score: %d" %highScore


func _on_player_enemy_killed() -> void:
	score += 1


func _on_game_over_game_start() -> void:
	score = 0
