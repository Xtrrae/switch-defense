extends Node2D

var points = 0;
var level = 1;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_points(d) -> void:
	points += d
	var goalForNextLevel = 1.9 * pow(level + 1, 2) + 12
	if points >= goalForNextLevel:
		level += 1;
		print("leveled up to: ", level, ", points: ", points)
	$PointsLabel.text = "%.0d" % points
	$LevelLabel.text = "%d" % level
