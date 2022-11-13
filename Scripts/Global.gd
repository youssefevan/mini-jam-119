extends Node

var boonDollars = 20
var current_wave: int

var death_target: int
var deaths: int

var game_over = false

func _ready():
	deaths = 0
	death_target = 20
	current_wave = 1
	game_over = false

func new_wave():
	current_wave += 1
	deaths = 0
	death_target *= 1.1
	print(current_wave, ", ", death_target)

func game_over():
	game_over = true
	
