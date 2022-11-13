extends "res://Scripts/TowerBase.gd"

func _physics_process(delta):
	if current == true:
		aim()
		shoot()
	
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
