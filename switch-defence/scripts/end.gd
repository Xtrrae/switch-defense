extends Node2D

var ending_points = 0
var ending_level = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$EndPointsLabel.text = "%d" % ending_points
	$EndLevelLabel.text = "%d" % ending_level


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/game.tscn")
