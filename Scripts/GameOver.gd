extends Node2D

func _ready():
	$Label2.text = "Devils Defeated: " + str(Global.kills)

func _input(event):
	if Input.is_action_just_pressed("restart"):
		Global.game_over = false
		Global.kills = 0
		$DeleteAll.call_deferred("free")
		get_tree().change_scene("res://Scenes/Stone.tscn")

func _on_DeleteAll_body_entered(body):
	body.call_deferred("free")
