extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_borde_area_entered(area):
	if area.get_collision_layer() == 8:
		area.call_deferred("free")
		print("scoop")
