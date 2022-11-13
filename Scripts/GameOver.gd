extends Node2D

func _on_DeleteAll_body_entered(body):
	body.call_deferred("free")
