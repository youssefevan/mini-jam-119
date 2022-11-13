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
	$BookAxis.look_at(get_global_mouse_position())
	flip()
	
func shoot():
	if Input.is_action_just_pressed("fire"):
		#$Animator.play("ShootAnim")
		
		var orb = load("res://Scenes/LightOrb.tscn").instance()
		
		orb.rotation = $BookAxis.global_rotation
		orb.position = $BookAxis/Book.global_position - ($BookAxis.global_position)
		
		add_child(orb)

func _on_Hurtbox_body_entered(body):
	if body.get_collision_layer() == 4:
		health -= 1
		get_parent().occupied = false
		body.death()
