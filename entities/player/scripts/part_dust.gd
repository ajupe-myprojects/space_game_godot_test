extends CPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	emitting = false



func _process(delta):
	emitting = global.player_ship_dust_on

