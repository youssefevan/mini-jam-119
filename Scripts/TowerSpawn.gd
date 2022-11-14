extends Area2D

signal deselected()
signal selected()

var tower1_node = load("res://Scenes/Tower.tscn")
var tower2_node = load("res://Scenes/Tower2.tscn")
var tower3_node = load("res://Scenes/Tower3.tscn")
var hover: bool

export var spawnNumber: int
var selected: bool
var occupied: bool

func _ready():
	selected = false
	occupied = false
	$Purchase.visible = false

func _physics_process(delta):
	if selected == true:
		if occupied == false:
			$Purchase.visible = true
		else:
			$Purchase.visible = false
		
		$Sprite.frame = 1
	else:
		$Purchase.visible = false
		$Sprite.frame = 0

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
			emit_signal("selected")

func _on_TowerSpawn_mouse_exited():
	hover = false

func _on_TowerSpawn_mouse_entered():
	hover = true

func _on_Spawn1_mouse_entered():
	$Purchase/Spawn1/Sprite.frame = 1
	hover = true

func _on_Spawn1_mouse_exited():
	$Purchase/Spawn1/Sprite.frame = 0
	hover = false

func _on_Spawn2_mouse_entered():
	$Purchase/Spawn2/Sprite.frame = 1
	hover = true

func _on_Spawn2_mouse_exited():
	$Purchase/Spawn2/Sprite.frame = 0
	hover = false

func _on_Spawn3_mouse_entered():
	$Purchase/Spawn3/Sprite.frame = 1
	hover = true

func _on_Spawn3_mouse_exited():
	$Purchase/Spawn3/Sprite.frame = 0
	hover = false

func _on_Spawn1_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			var price = 20
			if Global.boonDollars >= price:
				var tower1 = tower1_node.instance()
				add_child(tower1)
				tower1.current = true
				occupied = true
				Global.boonDollars -= price

func _on_Spawn2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			var price = 20
			if Global.boonDollars >= price:
				var tower2 = tower2_node.instance()
				add_child(tower2)
				tower2.current = true
				occupied = true
				Global.boonDollars -= price


func _on_Spawn3_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			var price = 20
			if Global.boonDollars >= price:
				var tower3 = tower3_node.instance()
				add_child(tower3)
				tower3.current = true
				occupied = true
				Global.boonDollars -= price
