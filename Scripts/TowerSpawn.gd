extends Area2D

export var spawnNumber: int
var selected: bool

func _ready():
	selected = false

func _physics_process(delta):
	pass

func _on_TowerSpawn_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			selected = true
