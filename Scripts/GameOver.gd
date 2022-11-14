extends Node2D

func _input(event):
	if Input.is_action_just_pressed("restart"):
		Global.game_over = false
		$DeleteAll.call_deferred("free")
		get_tree().change_scene("res://Scenes/Stone.tscn")

func _on_DeleteAll_body_entered(body):
	body.call_deferred("free")
