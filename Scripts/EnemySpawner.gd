extends Node2D

export (PackedScene) var enemy_type = null

export var vertical := false

export var target_node: NodePath
onready var target = get_node(target_node)

var random = RandomNumberGenerator.new()

export var min_spawn_rate := 2.0
export var max_spawn_rate := 5.0
var spawn_rate_modifier := 0.8 # decreases spawn rate by 10% per wave
var spawn_wait: float

var spawn: bool
var wait: bool

func _ready():
	spawn = true
	wait = false

func _physics_process(delta):
	random.randomize()
	spawn_wait = random.randf_range(min_spawn_rate, max_spawn_rate)
	
	if Global.game_over == false:
		if spawn == true and wait == false:
			spawn_enemy()
	
	if (Global.death_target - Global.deaths) <= 0:
		Global.new_wave()
		min_spawn_rate *= spawn_rate_modifier
		max_spawn_rate *= spawn_rate_modifier
		print(min_spawn_rate, ", ", max_spawn_rate)
		print("--------")
		wait = true
		yield(get_tree().create_timer(10), "timeout")
		wait = false
		

func spawn_enemy():
	spawn = false
	yield(get_tree().create_timer(spawn_wait), "timeout")
	
	var enemy = enemy_type.instance()
	var spawn_offset = random.randf_range(-70, 70)
	
	if vertical == false:
		enemy.position = global_position + Vector2(spawn_offset, 0)
	else: 
		enemy.position = global_position + Vector2(0, spawn_offset)
	
	if Global.game_over == false:
		enemy.locate_target(target)
		get_tree().get_root().call_deferred("add_child", enemy)
	
	spawn = true
