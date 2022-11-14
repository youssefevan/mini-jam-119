extends Area2D

export var health := 50

func _physics_process(delta):
	if health <= 0:
		Global.game_over()
		call_deferred("free")

func _on_Apple_body_entered(body):
	if body.get_collision_layer() == 4:
		body.call_deferred("free")
		
		if body.is_in_group("Enemy1"):
			health -= body.damage
			$HealthBar/ProgressBar.value -= body.damage
		
		if body.is_in_group("Enemy2"):
			health -= body.damage
			$HealthBar/ProgressBar.value -= body.damage
		
		if body.is_in_group("Enemy3"):
			health -= body.damage
			$HealthBar/ProgressBar.value -= body.damage
