extends CharacterBody2D

var destruction_combination = [false, false, false, false];
var type = ""; # attack_focused | speed_focused
var speed = 0;
var attack = 0;

const target = Vector2(576, 324);

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# choose a random combination and update the label
	for i in range(4):
		destruction_combination[i] = randi_range(0, 1) == 0
	if destruction_combination == [0, 0, 0, 0]: # 0,0,0,0 shouldn't be an option
		destruction_combination[randi_range(0, 3)] = 1 # if it's 0,0,0,0 -> set a random digit to 1
	var dc_label: Label = get_node("DefeatCombinationLabel")
	dc_label.text = "%d%d%d%d" % destruction_combination.map(func (x): if x: return 1 else: return 0)
	actor_setup()

func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame

	# Now that the navigation map is no longer empty, set the movement target.
	set_movement_target(target)

func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target

func _physics_process(_delta):
	if navigation_agent.is_navigation_finished():
		return

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	velocity = current_agent_position.direction_to(next_path_position) * speed * 1000
	
	move_and_slide()


func destroy() -> void:
	pass
