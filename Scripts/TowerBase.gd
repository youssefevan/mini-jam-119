extends KinematicBody2D

var current: bool
var towerNumber: int

func _ready():
	towerNumber = Global.numberOfTowers
	get_parent().connect("deselected", self ,"_on_deselected")
	get_parent().connect("selected", self ,"_on_selected")
	
#func _physics_process(delta):
#	if current == true:
#		aim()
#		shoot()
	
#func aim():
#	$BowAxis.look_at(get_global_mouse_position())
#	flip()
	
#func shoot():
#	if Input.is_action_just_pressed("fire"):
#		$Animator.play("ShootAnim")
#
#		var arrow = load("res://Arrow.tscn").instance()
#
#		arrow.rotation = $BowAxis.global_rotation
#		arrow.position = $BowAxis/Bow.global_position - ($BowAxis.global_position)
#
#		add_child(arrow)
	
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