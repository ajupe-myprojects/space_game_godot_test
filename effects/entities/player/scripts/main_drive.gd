extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false



func _process(delta):
	if Input.is_action_pressed("move_forward"):
		visible = true
	else:
		visible = false
