extends Node2D

var game_timer: float = 0.0
var game_timer_running: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_timer_running:
		game_timer += delta
		$CanvasLayer/TimerLabel.text = str(game_timer).pad_decimals(2)

func reset_timer() -> void:
	game_timer = 0.0
	game_timer_running = true

func stop_timer() -> void:
	game_timer_running = false

func start_timer() -> void:
	game_timer_running = true


func _on_combo_timer_timeout() -> void:
	$ComboBar/ComboLabel.visible = false
