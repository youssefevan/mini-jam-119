extends "res://Scripts/TowerBase.gd"

func _physics_process(delta):
	if current == true:
		aim()
		
		if Input.is_action_just_pressed("fire"):
			shoot()
	
func aim():
	$BowAxis.look_at(get_global_mouse_position())
	flip()
	
func shoot():
	
	$Animator.play("ShootAnim")
	
	var arrow = load("res://Scenes/Arrow.tscn").instance()
	
	arrow.rotation = $BowAxis.global_rotation
	arrow.position = $BowAxis/Bow.global_position - ($BowAxis.global_position)
	
	add_child(arrow)
