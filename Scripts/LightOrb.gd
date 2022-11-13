extends Area2D

export var speed = 200

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_LightOrb_body_entered(body):
	if body.get_collision_layer() == 4:
		body.health -= 2
		call_deferred("free")
