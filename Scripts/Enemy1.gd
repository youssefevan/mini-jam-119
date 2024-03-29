extends KinematicBody2D

export var speed = 35
export var damage = 1

var target_pos := Vector2.ZERO
var tower_pos := Vector2.ZERO
var tower_detected: bool

var velocity := Vector2.ZERO
var health: int

func _ready():
	tower_detected = false
	health = 2

func _physics_process(delta):
	if (global_position.x - target_pos.x) <= 0:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
	
	if Global.game_over == false:
		if tower_detected == true:
			velocity = global_position.direction_to(tower_pos)
		else:
			velocity = global_position.direction_to(target_pos)
	else:
		velocity = lerp(velocity, Vector2.ZERO, 2 * delta)
	
	if health <= 0:
		death()
	
	move_and_collide(velocity * speed * delta)

func locate_target(target):
	target_pos = target.global_position

func death():
	Global.boonDollars += 1
	Global.deaths += 1
	Global.kills += 1
	call_deferred("free")

func _on_TowerDetection_body_entered(body):
	if body.get_collision_layer() == 2:
		tower_detected = true
		tower_pos = body.global_position

func _on_TowerDetection_body_exited(body):
	if body.get_collision_layer() == 2:
		tower_detected = false
