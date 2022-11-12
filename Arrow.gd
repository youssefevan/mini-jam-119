extends Area2D

# Declare member variables here. Examples:
export var speed = 750
var velocity = Vector2()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += transform.x * speed * delta
	#this is to make the bullet fly to the right when fired

