extends "res://Scripts/TowerBase.gd"

func _physics_process(delta):
	if current == true:
		aim()
		shoot()
	
func aim():
	$BookAxis.look_at(get_global_mouse_position())
	flip()
	
func shoot():
	if Input.is_action_just_pressed("fire"):
		#$Animator.play("ShootAnim")
		
		var orb = load("res://Scenes/LightOrb.tscn").instance()
		
		orb.rotation = $BookAxis.global_rotation
		orb.position = $BookAxis/Book.global_position - ($BookAxis.global_position)
		
		add_child(orb)
