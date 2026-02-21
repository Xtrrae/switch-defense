extends Node

var wait_time = 3;
var min_wait_time = 0.3;
var timer: Timer
var monster_scene: Resource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = $Timer
	timer.one_shot = false
	timer.wait_time = wait_time
	monster_scene = load("res://scenes/monster.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	# spawn monster
	var monster: StaticBody2D = monster_scene.instantiate()
	
	match randi_range(0, 3):
		0: # top, x: [-100, 1252], y: -100	
			monster.position = Vector2(randi_range(-100, 1252), -100)
		1: # left, x: -100, y: [-100, 748]
			monster.position = Vector2(-100, randi_range(-100, 748))
		2: # right: x, 1352, y: [-100, 748]
			monster.position = Vector2(1352, randi_range(-100, 748))
		3: # bottom, x: [-100, 1252], y: 748
			monster.position = Vector2(randi_range(-100, 1252), 748)
	
	# set new wait time by level
