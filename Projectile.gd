extends Area2D

export var speed: int = 750
var direction: Vector2


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#check it 
#is it updated?


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	position += direction * speed * delta
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
