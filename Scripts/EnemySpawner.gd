extends Node2D

export var ememy_type1 = preload("res://Scenes/Enemy1.tscn")
export var game_manager_node: NodePath
onready var game_manager = get_node(game_manager_node)
var random = RandomNumberGenerator.new()

var min_spawn_rate := .3
var max_spawn_rate := 2.0
var min_spawn_rate_modifier := 0.8 # decreases min spawn by 20% per wave
var spawn_wait: float

var spawn: bool

func _ready():
	game_manager.connect("change_wave", self ,"_on_change_wave")
	spawn = true

func _physics_process(delta):
	random.randomize()
	spawn_wait = random.randf_range(min_spawn_rate, max_spawn_rate)
	
	if spawn == true:
		spawn_enemy()

func spawn_enemy():
	spawn = false
	yield(get_tree().create_timer(spawn_wait), "timeout")
	
	var enemy = ememy_type1.instance()
	var spawn_offset = random.randf_range(-50, 50)
	enemy.position = global_position + Vector2(spawn_offset, 0)
	get_tree().get_root().call_deferred("add_child", enemy)
	
	spawn = true

func _on_change_wave():
	min_spawn_rate *= min_spawn_rate_modifier
