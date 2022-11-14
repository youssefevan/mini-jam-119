extends Node2D

func _ready():
	$Label2.text = "Devils Defeated: " + str(Global.kills)

func _on_DeleteAll_body_entered(body):
	body.call_deferred("free")

func _on_Restart_mouse_entered():
	$Restart/Sprite.frame = 1

func _on_Restart_mouse_exited():
	$Restart/Sprite.frame = 0

func _on_Restart_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			Global.game_over = false
			Global.kills = 0
			$DeleteAll.call_deferred("free")
			get_tree().change_scene("res://Scenes/Stone.tscn")
