extends CharacterBody2D

var destruction_combination = [false, false, false, false];
var type = ""; # attack_focused | speed_focused
var speed = 0;
var attack = 0;

const target = Vector2(576, 324);

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# choose a random combination and update the label
	for i in range(4):
		destruction_combination[i] = randi_range(0, 1) == 0
	var dc_label: Label = get_node("DefeatCombinationLabel")
	dc_label.text = "%d%d%d%d" % destruction_combination.map(func (x): if x: return 1 else: return 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = position.lerp(target, speed * delta)

func destroy() -> void:
	pass
