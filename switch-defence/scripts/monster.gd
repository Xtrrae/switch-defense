extends CharacterBody2D

var destruction_combination: Array[bool] = [false, false, false, false];
var type = ""; # attack_focused | speed_focused
var speed = 0;
var attack = 0;

var starting_position = Vector2(0, 0)

var target
var in_rebound = false;

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# choose a random combination and update the label
	for i in range(4):
		destruction_combination[i] = randi_range(0, 1) == 0
	if destruction_combination == [false, false, false, false]: # 0,0,0,0 shouldn't be an option
		destruction_combination[randi_range(0, 3)] = 1 # if it's 0,0,0,0 -> set a random digit to 1
	var dc_label: Label = get_node("DefeatCombinationLabel")
	dc_label.text = "%d%d%d%d" % destruction_combination.map(func (x): if x: return 1 else: return 0)
	actor_setup()
	
	# set target
	#target = Vector2(576, 324);
	#target = +/- 110, +/- 50
	target = Vector2(576 + randi_range(-110, 110), 324 + randi_range(-50, 50))

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	set_movement_target(target)

func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target

func _physics_process(delta):
	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	
	var effective_speed = speed
	if in_rebound:
		effective_speed *= 6.7

	velocity = (next_path_position - current_agent_position) * effective_speed

	if navigation_agent.is_target_reached() and in_rebound:
		in_rebound = false
		print("rebound done, target: ", target)
		set_movement_target(target)
		
	move_and_slide()

func rebound() -> void:
	const REBOUND_FRACTION = 0.5
	in_rebound = true
	set_movement_target(position + (starting_position - position) * REBOUND_FRACTION)

func destroy() -> void:
	pass
