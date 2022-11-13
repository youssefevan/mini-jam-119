extends Node2D

func _physics_process(delta):
	$Label.text = "Points: " + str(Global.boonDollars)
