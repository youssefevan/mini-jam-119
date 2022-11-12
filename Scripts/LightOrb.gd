extends Area2D

export var speed = 200
var velocity = Vector2()

func _physics_process(delta):
	position += transform.x * speed * delta
