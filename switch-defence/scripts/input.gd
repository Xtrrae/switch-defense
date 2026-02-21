extends Node2D

signal combination_changed

var current_combination: Array[bool]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("make sure all switches are off")
	current_combination = [false, false, false, false]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not $StartingDelay.is_stopped():
		return
	
	if Input.is_action_just_pressed("switch_1"):
		combi_change_pos(0, true)
	elif Input.is_action_just_pressed("switch_2"):
		combi_change_pos(1, true)
	elif Input.is_action_just_pressed("switch_3"):
		combi_change_pos(2, true)
	elif Input.is_action_just_pressed("switch_4"):
		combi_change_pos(3, true)
	
	if Input.is_action_just_released("switch_1"):
		combi_change_pos(0, false)
	elif Input.is_action_just_released("switch_2"):
		combi_change_pos(1, false)
	elif Input.is_action_just_released("switch_3"):
		combi_change_pos(2, false)
	elif Input.is_action_just_released("switch_4"):
		combi_change_pos(3, false)


func combi_change_pos(index: int, new_state: bool) -> void:
	var combi_label_str: String = ""
	current_combination[index] = new_state
	for state in current_combination:
		combi_label_str += str(int(state))
	$CurrentCombiLabel.text = combi_label_str
	print(current_combination)
	combination_changed.emit()
