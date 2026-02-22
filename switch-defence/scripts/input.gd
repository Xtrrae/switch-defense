extends StaticBody2D

@onready var switches: TileMapLayer = $Switches
@onready var switch_1: AnimatedSprite2D = $Switch1
@onready var switch_2: AnimatedSprite2D = $Switch2
@onready var switch_3: AnimatedSprite2D = $Switch3
@onready var switch_4: AnimatedSprite2D = $Switch4

signal combination_changed(current_combination)

var current_combination: Array[bool] = [false, false, false, false]
var animate: Array[bool] = [false, false, false, false]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("switch_1"):
		animate[0] = true
		combi_change_pos(0, true)

	if event.is_action_pressed("switch_2"):
		animate[1] = true
		combi_change_pos(1, true)

	if event.is_action_pressed("switch_3"):
		animate[2] = true
		combi_change_pos(2, true)

	if event.is_action_pressed("switch_4"):
		animate[3] = true
		combi_change_pos(3, true)

	if event.is_action_released("switch_1"):
		animate[0] = true
		combi_change_pos(0, false)

	if event.is_action_released("switch_2"):
		animate[1] = true
		combi_change_pos(1, false)

	if event.is_action_released("switch_3"):
		animate[2] = true
		combi_change_pos(2, false)

	if event.is_action_released("switch_4"):
		animate[3] = true
		combi_change_pos(3, false)
		
	if current_combination[0] and animate[0]:
		switch_1.play("move_up")
		animate[0] = false
	elif !current_combination[0] and animate[0]:
		switch_1.play("move_down")
		animate[0] = false

	if current_combination[1] and animate[1]:
		switch_2.play("move_up")
		animate[1] = false
	elif !current_combination[1] and animate[1]:
		switch_2.play("move_down")
		animate[1] = false

	if current_combination[2] and animate[2]:
		switch_3.play("move_up")
		animate[2] = false
	elif !current_combination[2] and animate[2]:
		switch_3.play("move_down")
		animate[2] = false

	if current_combination[3] and animate[3]:
		switch_4.play("move_up")
		animate[3] = false
	elif !current_combination[3] and animate[3]:
		switch_4.play("move_down")
		animate[3] = false
		
func combi_change_pos(index: int, new_state: bool) -> void:
	var combi_label_str: String = ""
	current_combination[index] = new_state
	for state in current_combination:
		combi_label_str += str(int(state))
	
	$CurrentCombiLabel.text = combi_label_str
	
	combination_changed.emit(current_combination)


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("enemy entered")
	if body.name.contains("Monster"):
		body.modulate = Color("red")
		body.rebound()
		$"../CanvasLayer/HealthProgressBar".change_health(body.attack)
