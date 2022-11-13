extends "res://Scripts/TowerBase.gd"

export var health := 4
export var active_fire_rate := 0.2
export var passive_fire_rate := 0.4
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
		call_deferred("free")
	
func aim():
	$BowAxis.look_at(get_global_mouse_position())
	flip()
	
func shoot():
	can_shoot = false
	
	$Animator.play("ShootAnim")
	
	var arrow = load("res://Scenes/Arrow.tscn").instance()
	
	arrow.rotation = $BowAxis.global_rotation
	arrow.position = $BowAxis/Bow.global_position - ($BowAxis.global_position)
	
	get_parent().add_child(arrow)
	
	if current == true:
		yield(get_tree().create_timer(active_fire_rate), "timeout")
		can_shoot = true
	else:
		yield(get_tree().create_timer(passive_fire_rate), "timeout")
		can_shoot = true

func _on_Hurtbox_body_entered(body):
	if body.get_collision_layer() == 4:
		health -= 1
		get_parent().occupied = false
		body.call_deferred("free")
