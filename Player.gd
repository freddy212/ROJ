extends KinematicBody2D

var speed = 5
var run = false
var direction = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	if run:
		set_direction()
		move_and_collide(direction * speed)

func set_direction():
	direction = position.direction_to(get_global_mouse_position()).normalized()

func _input(event):
	if event.is_action_pressed("left_mouse"):
		run = true
	elif event.is_action_released("left_mouse"):
		run = false					


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
