extends Node2D

var enemy_1 = load("res://main/global/enemy_1_pathing.tscn")
var enemy_2 = load("res://main/global/enemy_2_pathing.tscn")

var t_on = false
var e_1
var e_2
var wave_number = 1

@onready var timer = $spawn_timer
@onready var button = $"../hud/start_button"

func _ready():
	waves()

func _physics_process(_delta):
	if t_on == false:
		button.text = "Start"
	if t_on == true:
		button.text = "Stop"
	
	$"../hud/money_count".text = "$" + str(Utils.coins)

###

func waves():
	if wave_number == 1:
		e_1 = 10 
		e_2 = 0
	if wave_number == 2:
		e_1 = 8
		e_2 = 2
	if wave_number == 3:
		e_1 = 5
		e_2 = 5

func _on_start_button_pressed():
	if t_on == false:
		timer.start()
		t_on = true
	elif t_on == true:
		timer.stop()
		t_on = false

func spawn1():
	var spawnling = enemy_1.instantiate()
	
	add_child(spawnling)

func spawn2():
	var spawnling = enemy_2.instantiate()

	add_child(spawnling)

func _on_spawn_timer_timeout():
	if e_1 > 0:
		spawn1()
		e_1 -= 1
	if e_1 == 0 and e_2 > 0:
		spawn2()
		e_2 -= 1
	if e_1 + e_2 == 0:
		timer.stop()
		t_on = false
		wave_number += 1
		waves()
