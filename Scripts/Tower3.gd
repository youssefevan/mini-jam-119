extends "res://Scripts/TowerBase.gd"

export var health := 2

func _physics_process(delta):
	if current == true:
		aim()
		
		if Input.is_action_just_pressed("fire"):
			shoot()
	
	if (health <= 0):
		call_deferred("free")
	
func aim():
	$EyeAxis.look_at(get_global_mouse_position())
	flip()
	
func shoot():
	if Input.is_action_just_pressed("fire"):
		#$Animator.play("ShootAnim")
		
		var beam = load("res://Scenes/Beam.tscn").instance()
		
		beam.rotation = $EyeAxis.global_rotation
		beam.position = $EyeAxis/Eye.global_position - ($EyeAxis.global_position)
		
		add_child(beam)

func _on_Hurtbox_body_entered(body):
	if body.get_collision_layer() == 4:
		health -= 1
		get_parent().occupied = false
		body.call_deferred("free")
