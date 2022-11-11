extends Sprite

func _physics_process(delta):
	$BowAxis.look_at(get_global_mouse_position())
