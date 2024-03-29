extends "res://Scripts/TowerBase.gd"

export var health := 5

export var active_fire_rate := 0.3
export var passive_fire_rate := 0.5
var can_shoot: bool

func _ready():
	can_shoot = true

func _physics_process(delta):
	if current == true:
		aim()
		if can_shoot:
			shoot()
		
	elif can_shoot:
		shoot()
	
	if (health <= 0):
		get_parent().occupied = false
		call_deferred("free")
	
func aim():
	$BookAxis.look_at(get_global_mouse_position())
	flip()
	
func shoot():
	can_shoot = false
	
	#$Animator.play("ShootAnim")
		
	var orb = load("res://Scenes/LightOrb.tscn").instance()
		
	orb.rotation = $BookAxis.global_rotation
	orb.position = $BookAxis/Book.global_position - ($BookAxis.global_position)
		
	get_parent().add_child(orb)
		
	if current == true:
		yield(get_tree().create_timer(active_fire_rate), "timeout")
		can_shoot = true
	else:
		yield(get_tree().create_timer(passive_fire_rate), "timeout")
		can_shoot = true

func _on_Hurtbox_body_entered(body):
	if body.get_collision_layer() == 4:
		health -= body.damage
		
		body.call_deferred("free")
