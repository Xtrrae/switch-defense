extends Node2D

var points = 0;
var level = 1;
var total_destroyed = 0; # combinations entered

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	# 1.9x^2 + 12 = points
	# (point - 12)/1.9 = x^2
	#level = sqrt((points - 12)/1.9)
	#$PointsLabel.text = "%.0d" % points
	#$LevelLabel.text = "%d" % level


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_points(d) -> void:
	points += d
		# (0, 56] -> y=-0.0021x^2+.23521x+1.288
	# (56, inf) -> y = .033x+7.85
	if total_destroyed >= 56:
		level = roundi(-0.0021*pow(total_destroyed,2)+(.23521*total_destroyed)+1.288)
	else:
		level = roundi(.033*total_destroyed + 7.85)
	$PointsLabel.text = "%.0d" % points
	$LevelLabel.text = "%d" % level
