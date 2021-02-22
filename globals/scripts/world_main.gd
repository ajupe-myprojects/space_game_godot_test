extends Node2D

export (int) var num_ast = 20

var pos_x = 0
var pos_y = 0
var sca_x = 0
var choice = 0


# Called when the node enters the scene tree for the first time.(spawning asteroids)
func _ready():
	var asteroidscene1 = load("res://entities/asteroids/asteroid_01.tscn")
	var asteroidscene2 = load("res://entities/asteroids/asteroid_02.tscn")
	var asteroidscene3 = load("res://entities/asteroids/asteroid_03.tscn")
	var asteroidscene4 = load("res://entities/asteroids/asteroid_04.tscn")
	for i in range(num_ast):
		var posnts = random_pos(global.pos_all)
		pos_x = posnts[0]
		pos_y = posnts[1]
		global.pos_all.append(posnts)
		randomize()
		sca_x = rand_range(0.5, 1.0)
		choice = rand_range(0, 8)
		
		if choice <= 2:
			set_meta("asteroid" + str(i), asteroidscene1.instance())
		elif choice > 2 and choice <= 4:
			set_meta("asteroid" + str(i), asteroidscene2.instance())
		elif choice > 4 and choice <= 6:
			set_meta("asteroid" + str(i), asteroidscene3.instance())
		else:
			set_meta("asteroid" + str(i), asteroidscene4.instance())

		get_meta("asteroid" + str(i)).position = Vector2(pos_x, pos_y)
		get_meta("asteroid" + str(i)).scale = Vector2(sca_x, sca_x)
		get_node(".").call_deferred("add_child", get_meta("asteroid" + str(i)))
		#print_debug(get_meta("asteroid" + str(i)).position)
	print_debug(global.pos_all)	
	set_process(true)
	set_process_input(true)
	

#func _input(event):
	#if (event is InputEventMouseButton) and event.pressed:
		#print_debug('click')

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#making sure no asteroids are overlapping
func random_pos(pos_all):
	var check = 0
	pos_x = rand_range(-4000, 4000)
	pos_y = rand_range(-4000, 4000)

	while check != pos_all.size():
		
		randomize()
		pos_x = rand_range(-4000, 4000)
		pos_y = rand_range(-4000, 4000)
		check = 0
		for ps in pos_all:
			if (pos_x > ps[0] + 100 or pos_x <= ps[0] - 100) and (pos_y >= ps[1] + 100 or pos_y < ps[1] - 100):
				check += 1
				
	#print_debug(check)
	return [pos_x, pos_y]

