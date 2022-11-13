extends KinematicBody2D

var current: bool
var towerNumber: int

func _ready():
	#towerNumber = Global.numberOfTowers
	get_parent().connect("deselected", self ,"_on_deselected")
	get_parent().connect("selected", self ,"_on_selected")

func flip():
	var mPOS = get_global_mouse_position() - self.global_position
	if (mPOS.x > 0):
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false

func _on_deselected():
	current = false

func _on_selected():
	current = true

