extends ProgressBar

var health = 100;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func change_health(d: float) -> void:
	health -= d
	value = health
	if value <= 0:
		var next_scene = load("res://scenes/end.tscn").instantiate()
		next_scene.ending_points = $"../Points".points
		next_scene.ending_level = $"../Points".level
		
		get_tree().root.add_child(next_scene)
		get_tree().current_scene.queue_free()
		get_tree().current_scene = next_scene
