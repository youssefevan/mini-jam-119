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
	
	print($BowAxis/Bow.global_position)
	
func aim():
	$BowAxis.look_at(get_global_mouse_position())
	
func shoot():
	if Input.is_action_just_pressed("fire"):
		var arrow = load("res://Arrow.tscn").instance()
		
		arrow.rotation = $BowAxis.global_rotation
		arrow.position = $BowAxis/Bow.global_position - ($BowAxis.global_position)
		#stupid position setter
#		arrow.position.x = (position.x*cos(arrow.rotation))
#		arrow.position.y = (position.y*sin(arrow.rotation))
		
#		arrow.position = $
		
		add_child(arrow)
	
	
	
