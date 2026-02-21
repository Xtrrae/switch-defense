extends Node

var wait_time = 4;
const min_wait_time = 1;
var timer: Timer
var monster_scene: Resource
const max_speed = 0.3;
const max_attack = 25;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = $Timer
	monster_scene = load("res://scenes/monster.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	# spawn monster
	var monster: StaticBody2D = monster_scene.instantiate()
	var current_level = $"../Points".level
	
	if randi_range(0, 1) == 0:
		# speed focused
		monster.type = "speed_focused"
		monster.speed = min(.06 * current_level, max_speed)
		monster.attack = min(current_level, max_attack)
	else:
		# attack focused
		monster.type = "attack_focused"
		monster.speed = min(.01 * current_level, max_speed)
		monster.attack = min(4 * current_level, max_attack)
	
	
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
	wait_time = max(min_wait_time, wait_time - (current_level / 4))
	print("new wt: ", wait_time)
	timer.wait_time = wait_time
	$"../".add_child(monster)
