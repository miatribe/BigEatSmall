extends Node


@export var enemyScene: PackedScene
@export var spawnTimeStartingWaitTime:= 0.25

@onready var enemies: Node = $Enemies
@onready var spawn_timer: Timer = $SpawnTimer
@onready var spawn_location: PathFollow2D = $SpawnPath/SpawnLocation
@onready var game_over: MarginContainer = $UI/GameOver


func _ready() -> void:
	get_tree().paused = true;


func _on_spawn_timer_timeout() -> void:
	spawn_location.progress_ratio = randf()
	var enemy = enemyScene.instantiate()
	enemy.position = spawn_location.position
	if enemy.position.x > 1000:
		enemy.direction = Vector2.LEFT
	elif enemy.position.x < 0:
		enemy.direction = Vector2.RIGHT
	elif enemy.position.y  > 1000:
		enemy.direction = Vector2.UP
	else: 
		enemy.direction = Vector2.DOWN
	enemies.add_child(enemy)


func _on_main_menu_game_start() -> void:
	spawn_timer.wait_time = spawnTimeStartingWaitTime
	var enemiesToRemove = enemies.get_children()
	for e in enemiesToRemove:
		e.queue_free()


func _on_player_player_died() -> void:
	get_tree().paused = true;
	game_over.visible = true


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_player_enemy_killed() -> void:
	spawn_timer.wait_time = max(spawn_timer.wait_time - 0.01,0.025)
