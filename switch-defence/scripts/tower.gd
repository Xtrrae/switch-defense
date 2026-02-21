extends Area2D

var health_points: int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	$HealthDecrementTimer.start()


func _on_body_exited(body: Node2D) -> void:
	$HealthDecrementTimer.stop()


func _on_health_decrement_timer_timeout() -> void:
	health_points -= 10
