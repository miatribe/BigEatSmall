extends MarginContainer


signal gameStart


func _on_start_pressed() -> void:
	get_tree().paused = false;
	visible = false;
	gameStart.emit()
