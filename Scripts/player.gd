extends Area2D


signal playerDied
signal enemyKilled

var sreen_size:Vector2
var player_collision_offset:Vector2

@export var speed := 200
 
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	var shapeRadius = collision_shape_2d.shape.radius
	player_collision_offset = Vector2(shapeRadius,shapeRadius)
	sreen_size = get_viewport_rect().size - player_collision_offset


func _process(delta: float) -> void:
	var vector = Input.get_vector("Left", "Right","Up","Down")	
	position += vector * speed * delta
	position = position.clamp(player_collision_offset,sreen_size)


func _on_area_entered(area: Area2D) -> void:
	if(area.scale < scale):
		area.queue_free()
		enemyKilled.emit()
	else:
		position = Vector2(500,500)
		playerDied.emit()
