extends Area2D

# Declare member variables here. Examples:
export var speed = 50
var velocity = Vector2()

func _ready():
	call_timer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += transform.x * speed * delta
	#this is to make the bullet fly to the right when fired
func call_timer():
	yield(get_tree().create_timer(1), "timeout")
	call_deferred("free")
