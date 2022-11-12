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

func aim():
	$BowAxis.look_at(get_global_mouse_position())
