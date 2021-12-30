extends KinematicBody2D

var speed = 5
var run = false
var direction = Vector2()
var fireball = preload("res://Fireball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _physics_process(delta):
	if run:
		set_direction()
		move_and_collide(direction * speed)

func set_direction():
	direction = position.direction_to(get_global_mouse_position()).normalized()
	$"3dsprite/Viewport/Base Mesh sculpt 3/Camera".rotation_degrees = Vector3(-80,-180,	(direction.angle() / PI) * 180 + 90)
	
func _shoot(): 
	var b = fireball.instance()
	b.direction = direction
	var startPosOffset = direction * 50
	b.position = position + Vector2(startPosOffset.x,startPosOffset.y)
	b.rotation_degrees = (direction.angle() / PI) * 180 
	owner.add_child(b)
	
func _input(event):
	if event.is_action_pressed("left_mouse"):
		run = true
	elif event.is_action_released("left_mouse"):
		run = false
	if event.is_action_pressed("Q"):
		_shoot()					


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
