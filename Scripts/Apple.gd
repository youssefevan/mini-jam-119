extends Area2D

func _on_Apple_body_entered(body):
	if body.get_collision_layer() == 4:
		body.call_deferred("free")
