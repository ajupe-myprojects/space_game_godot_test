extends KinematicBody2D


export (int) var speed = 1
export (float) var rotation_speed = 1.5
export (float) var brake_front = 0.5
export (float) var brake_sides = 0.3
export (float) var drag = 0.005
var col_obj = null


var velocity = Vector2()
var rotation_dir = 0


func get_input(speed, brake_front, brake_sides):
	
	#velocity = Vector2()
	if Input.is_action_pressed("rotate_right"):
		rotation_dir += 0.005
	if Input.is_action_pressed("rotate_left"):
		rotation_dir -= 0.005
	if Input.is_action_pressed("move_backward"):
		velocity -= Vector2(brake_front , 0).rotated(rotation)
	if Input.is_action_pressed("move_forward"):
		velocity += Vector2(speed, 0).rotated(rotation)
	if Input.is_action_pressed("move_left"):
		velocity += Vector2(brake_sides , 0).rotated(rotation - 1.572)
	if Input.is_action_pressed("move_right"):
		velocity += Vector2(brake_sides , 0).rotated(rotation + 1.572)
	if Input.is_action_pressed("stop_rot"):
		rotation_dir = 0
func _ready():
	position = Vector2(get_viewport_rect().size.x / 2, get_viewport_rect().size.y / 2)



func _physics_process(delta):
	velocity.x = lerp(velocity.x, 0, drag)
	velocity.y = lerp(velocity.y, 0, drag)
	get_input(speed, brake_front, brake_sides)
	rotation += (rotation_dir * rotation_speed) * delta
	
	col_obj = move_and_collide(velocity * delta)
	if col_obj:
		velocity = velocity.bounce(col_obj.normal)
	
	#velocity = move_and_slide(velocity)
	if abs(velocity.x) > 5 or abs(velocity.y) > 5:
		global.player_ship_dust_on = true
	else:
		global.player_ship_dust_on = false

