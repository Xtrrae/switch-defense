extends ProgressBar

var health = 1;

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
		get_tree().change_scene_to_file("res://scenes/end.tscn")
