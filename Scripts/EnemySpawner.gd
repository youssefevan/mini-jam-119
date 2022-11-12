extends Node2D

export var ememy_type1 = preload("res://Scenes/Enemy1.tscn")
export var game_manager_node: NodePath
onready var game_manager = get_node(game_manager_node)
var random = RandomNumberGenerator.new()

export var movement_range := 20.0
export var speed := 20.0

var min_spawn_rate := .3
var max_spawn_rate := 2.0
var min_spawn_rate_modifier := 0.8 # decreases min spawn by 20% per wave
var spawn_wait: float

var spawn: bool

func _ready():
	move()
	game_manager.connect("change_wave", self ,"_on_change_wave")
	spawn = true

func _physics_process(delta):
	random.randomize()
	spawn_wait = random.randf_range(min_spawn_rate, max_spawn_rate)
	
	if spawn == true:
		spawn_enemy()

func move():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "position",
			position, position + Vector2(movement_range, 0), .5,
			Tween.TRANS_LINEAR)
	tween.start()

func spawn_enemy():
	spawn = false
	yield(get_tree().create_timer(spawn_wait), "timeout")
	
	var enemy = ememy_type1.instance()
	enemy.position = global_position
	get_tree().get_root().call_deferred("add_child", enemy)
	
	spawn = true

func _on_change_wave():
	min_spawn_rate *= min_spawn_rate_modifier

func _on_Tween_tween_completed(object, key):
	var tween = get_node("Tween")
	tween.interpolate_property(self, "position",
			position, position + Vector2(-movement_range, 0), .5,
			Tween.TRANS_LINEAR)
	tween.start()
