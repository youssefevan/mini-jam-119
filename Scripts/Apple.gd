extends Area2D

export var health := 50

func _physics_process(delta):
	if health <= 0:
		Global.game_over()
		call_deferred("free")

func _on_Apple_body_entered(body):
	if body.get_collision_layer() == 4:
		health -= body.damage
		$HealthBar/ProgressBar.value -= body.damage
		
		body.call_deferred("free")
