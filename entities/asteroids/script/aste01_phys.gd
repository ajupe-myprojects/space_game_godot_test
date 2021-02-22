extends StaticBody2D


var ast_rot = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	rotation = 0
	randomize()
	ast_rot = rand_range(0.0005, 0.003)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += ast_rot
