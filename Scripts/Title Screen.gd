extends Node2D

func _on_StartBtn_mouse_entered():
	$StartBtn/Sprite.frame = 1

func _on_StartBtn_mouse_exited():
	$StartBtn/Sprite.frame = 0

func _on_StartBtn_input_event(viewport, event, shape_idx):
	if event.is_pressed():
		get_tree().change_scene("res://Scenes/Stone.tscn")
