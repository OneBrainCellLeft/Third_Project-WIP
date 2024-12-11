extends Node2D

var enemy_1 = load("res://main/global/enemy_1_pathing.tscn")

var t_on = false

@onready var timer = $spawn_timer
@onready var button = $"../hud/start_button"

func _physics_process(_delta):
	if t_on == false:
		button.text = "Start"
	if t_on == true:
		button.text = "Stop"
	
	$"../hud/$_count".text = "$" + str(Utils.coins)

###

func _on_start_button_pressed():
	if t_on == false:
		timer.start()
		t_on = true
	elif t_on == true:
		timer.stop()
		t_on = false

func spawn():
	var spawnling = enemy_1.instantiate()
	
	add_child(spawnling)

func _on_spawn_timer_timeout():
	spawn()
