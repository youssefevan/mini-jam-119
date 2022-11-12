extends KinematicBody2D

var current: bool

func _ready():
	pass

func _physics_process(delta):
	aim()

func aim():
	$BowAxis.look_at(get_global_mouse_position())
