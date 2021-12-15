
extends Area2D
enum MoveDirection {UP,DOWN,LEFT,RIGHT}
export var sceneToChange = ""
export var playerPos: Vector2 = Vector2(0,0)
export(MoveDirection) var direction = MoveDirection.UP
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Player_Entered(body:KinematicBody2D):
	if correct_Direction(body):
		var sceneChangePath = "res://Locations/" + sceneToChange + ".tscn"
		var scene = load(sceneChangePath) # Will load when parsing the script.
		var node = scene.instance()
		get_node("/root/World").call_deferred("add_child",node)
		get_node("/root/World").call_deferred("move_child",node,0)
		get_parent().queue_free()
		body.position = playerPos		
func correct_Direction(body):
	var result = false
	match direction:
		MoveDirection.UP: 
			result = body.direction.y <=-0.5
		MoveDirection.DOWN:
			result = body.direction.y >=0.5
		MoveDirection.LEFT:
			result = body.direction.x <=-0.5
		MoveDirection.RIGHT:
			result = body.direction.x >= 0.5
	return result							
	
func _physics_process(delta):
	var player = get_node("/root/World/Player")
	if(overlaps_body(player)):
		_on_Player_Entered(player)		
			
	
