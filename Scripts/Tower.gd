extends "res://Scripts/TowerBase.gd"

export var health := 2

func _physics_process(delta):
	if current == true:
		aim()
		
		if Input.is_action_just_pressed("fire"):
			shoot()
	
	if (health <= 0):
		call_deferred("free")
		emit_signal("dead")
	
func aim():
	$BowAxis.look_at(get_global_mouse_position())
	flip()
	
func shoot():
	
	$Animator.play("ShootAnim")
	
	var arrow = load("res://Scenes/Arrow.tscn").instance()
	
	arrow.rotation = $BowAxis.global_rotation
	arrow.position = $BowAxis/Bow.global_position - ($BowAxis.global_position)
	
	add_child(arrow)

func _on_Hurtbox_body_entered(body):
	if body.get_collision_layer() == 4:
		health -= 1
		get_parent().occupied = false
		body.call_deferred("free")
