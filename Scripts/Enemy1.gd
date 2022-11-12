extends KinematicBody2D

export var speed = 100

func _physics_process(delta):
	position.y += speed * delta
