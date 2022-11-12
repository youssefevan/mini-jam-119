extends Node

signal change_wave()

var wave_start: bool
var wave_end: bool
var wave: int

func _ready():
	wave = 1
	wave_start = true

func _physics_process(delta):
	pass
