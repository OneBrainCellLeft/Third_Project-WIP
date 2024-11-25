extends Node2D

var enemy_1 = load("res://main/maps/Tutorial/starter_area_pathing.tscn")

###

func spawn():
	var spawnling = enemy_1.instantiate()
	
	add_child(spawnling)

###

func _on_spawn_timer_timeout():
	spawn()
