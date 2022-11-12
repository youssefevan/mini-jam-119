extends Area2D

var tower_node = load("res://Scenes/Tower.tscn")

export var spawnNumber: int
var selected: bool

func _ready():
	selected = false

func _physics_process(delta):
	if selected == true:
		$Sprite.frame = 1
	else:
		$Sprite.frame = 0
	
	if selected and Input.is_action_just_pressed("select1"):
		var tower = tower_node.instance()
		add_child(tower)
		tower.current = true

func _on_TowerSpawn_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			selected = true
