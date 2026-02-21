extends Node2D

signal combination_changed(current_combination)

var current_combination: Array[bool] = [false, false, false, false]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("switch_1") or event.is_action_pressed("number_1"):
		combi_change_pos(0, true)
	elif event.is_action_pressed("switch_2") or event.is_action_pressed("number_2"):
		combi_change_pos(1, true)
	elif event.is_action_pressed("switch_3") or event.is_action_pressed("number_3"):
		combi_change_pos(2, true)
	elif event.is_action_pressed("switch_4") or event.is_action_pressed("number_4"):
		combi_change_pos(3, true)
	
	if event.is_action_released("switch_1") or event.is_action_released("number_1"):
		combi_change_pos(0, false)
	elif event.is_action_released("switch_2") or event.is_action_released("number_2"):
		combi_change_pos(1, false)
	elif event.is_action_released("switch_3") or event.is_action_released("number_3"):
		combi_change_pos(2, false)
	elif event.is_action_released("switch_4") or event.is_action_released("number_4"):
		combi_change_pos(3, false)


func combi_change_pos(index: int, new_state: bool) -> void:
	if new_state:
		find_child("SwitchOn" + str(index + 1)).visible = true
		find_child("SwitchOff" + str(index + 1)).visible = false
	else:
		find_child("SwitchOn" + str(index + 1)).visible = false
		find_child("SwitchOff" + str(index + 1)).visible = true
	
	var combi_label_str: String = ""
	current_combination[index] = new_state
	for state in current_combination:
		combi_label_str += str(int(state))
	
	$CurrentCombiLabel.text = combi_label_str
	
	combination_changed.emit(current_combination)
