extends KinematicBody2D

var current: bool
var towerNumber: int


func _ready():
	Global.numberOfTowers += 1
	towerNumber = Global.numberOfTowers
	
func _physics_process(delta):
	if Input.is_action_just_pressed("select1"):
		current = true
	
	if current == true:
		aim()
		shoot()
	
	
func aim():
	$BowAxis.look_at(get_global_mouse_position())
	
	flip()
	
func shoot():
	if Input.is_action_just_pressed("fire"):
		$Animator.play("ShootAnim")
		
		var arrow = load("res://Arrow.tscn").instance()
		
		arrow.rotation = $BowAxis.global_rotation
		arrow.position = $BowAxis/Bow.global_position - ($BowAxis.global_position)
		#stupid position setter
#		arrow.position.x = (position.x*cos(arrow.rotation))
#		arrow.position.y = (position.y*sin(arrow.rotation))
		
#		arrow.position = $
		
		add_child(arrow)
	
func flip():
	var mPOS = get_global_mouse_position() - self.global_position
	print (mPOS)
	if (mPOS.x > 0):
		$Sprite.flip_h = true
		
	else:
		$Sprite.flip_h = false
	
	
