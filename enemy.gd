extends Area2D


var direction:Vector2
var speed:float


func _ready() -> void:
	if randi() % 2 == 0:
		var rndSmall = randf_range(0.6, 0.9)
		scale = Vector2(rndSmall,rndSmall)
	else:
		var rndBig = randf_range(1.1, 1.4)
		scale = Vector2(rndBig,rndBig)
	modulate = Color.from_hsv((randi() % 12) / 12.0, 1, 1)
	speed = randf_range(50,150)


func _process(delta: float) -> void:
	position += direction * delta * speed


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
