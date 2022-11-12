extends Area2D

signal deselected()

var tower_node = load("res://Scenes/Tower.tscn")
var hover: bool

export var spawnNumber: int
var selected: bool
var occupied: bool

func _ready():
	selected = false
	occupied = false

func _physics_process(delta):
	if selected == true:
		$Sprite.frame = 1
	else:
		$Sprite.frame = 0
	
	if selected and Input.is_action_just_pressed("select1") and occupied == false:
		var tower = tower_node.instance()
		add_child(tower)
		tower.current = true
		occupied = true

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if hover == false:
				selected = false
				emit_signal("deselected")

func _on_TowerSpawn_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			selected = true

func _on_TowerSpawn_mouse_exited():
	hover = false

func _on_TowerSpawn_mouse_entered():
	hover = true
