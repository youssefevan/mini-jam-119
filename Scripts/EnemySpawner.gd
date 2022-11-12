extends Node2D

export var game_manager_node: NodePath
onready var game_manager = get_node(game_manager_node)
var random = RandomNumberGenerator.new()

export var movement_range := 20.0
export var speed := 20.0

var min_spawn_rate := 2.0
var max_spawn_rate := 5.0
var min_spawn_rate_modifier := 0.8 # decreases min spawn by 20% per wave
var spawn_wait: float

var spawn: bool

func _ready():
	game_manager.connect("change_wave", self ,"_on_change_wave")
	spawn = true

func _physics_process(delta):
	random.randomize()
	spawn_wait = random.randf_range(min_spawn_rate, max_spawn_rate)
	
	move()
	
	if spawn == true:
		spawn_enemy()

func move():
	pass
#	var tween = create_tween().set_trans(Tween.TRANS_LINEAR)
#	tween.tween_property(self, "position", position, position + Vector2(movement_range, 0), 1.0)

func spawn_enemy():
	spawn = false
	yield(get_tree().create_timer(spawn_wait), "timeout")
	
	var enemy = load("res://Scenes/Enemy1.tscn").instance()
	enemy.rotation = rotation
	enemy.position = global_position - $Sprite.global_position
	add_child(enemy)
	
	spawn = true

func _on_change_wave():
	min_spawn_rate *= min_spawn_rate_modifier
