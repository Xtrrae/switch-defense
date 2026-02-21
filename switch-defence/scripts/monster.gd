extends StaticBody2D

var destruction_combination = [0, 0, 0, 0];
var speed = 0;
var attack = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# choose a random combination and update the label
	for i in range(4):
		var r = randi_range(0, 1)
		destruction_combination[i] = r
	var dc_label: Label = get_node("DefeatCombinationLabel")
	dc_label.text = "%d%d%d%d" % destruction_combination


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
