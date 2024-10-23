extends Node3D

@onready var box = $Box

var transform_speed = 0.05
var tool = "none"

func _ready() -> void:
	pass # Replace with function body.

func transform_vec() -> Vector3:
	var change = Vector3.ZERO
	
	
	if Input.is_action_pressed("x-axis"):
		change = Vector3.RIGHT
	elif Input.is_action_pressed("y-axis"):
		change = Vector3.UP 
	elif Input.is_action_pressed("z-axis"):
		change = Vector3.FORWARD
	
	if Input.is_action_pressed("Increase"):
		change *= transform_speed
	elif Input.is_action_pressed("Decrease"):
		change *= (transform_speed * (-1))
	else:
		change = Vector3.ZERO
	
	return change

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("Translate"):
		tool = "move"
	if Input.is_action_just_released("Scale"):
		tool = "scale"
	if Input.is_action_just_released("Rotate"):
		tool = "rotate"
	
	if tool == "move":
		box.position += transform_vec()
	elif tool == "scale":
		box.scale += transform_vec()
	elif tool == "rotate":
		box.rotation += transform_vec()
