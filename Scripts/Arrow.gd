extends Area2D

# Declare member variables here. Examples:
export var speed = 500
var velocity = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += transform.x * speed * delta
	#this is to make the bullet fly to the right when fired

func _on_Arrow_body_entered(body):
	if body.get_collision_layer() == 4:
		body.health -= 1
		call_deferred("free")
