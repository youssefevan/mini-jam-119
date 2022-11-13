extends KinematicBody2D

export var speed = 70
export var damage = 3

var target_pos := Vector2.ZERO
var velocity := Vector2.ZERO
var health: int

func _ready():
	health = 1

func _physics_process(delta):
	if (global_position.x - target_pos.x) <= 0:
		$Sprite.flip_h = false
	else:
		$Sprite.flip_h = true
	
	if Global.game_over == false:
		velocity = global_position.direction_to(target_pos)
	else:
		velocity = lerp(velocity, Vector2.ZERO, 2 * delta)
	
	if health <= 0:
		death()
	
	move_and_collide(velocity * speed * delta)

func locate_target(target):
	target_pos = target.global_position

func death():
	Global.boonDollars += 3
	Global.deaths += 1
	call_deferred("free")
