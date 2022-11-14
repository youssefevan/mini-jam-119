extends Node2D

func _on_Start_mouse_entered():
	$Sprite.frame = 1

func _on_Start_mouse_exited():
	$Sprite.frame = 0

func _on_Start_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene("res://Scenes/Stone.tscn")
