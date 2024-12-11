extends Node2D

var bullet = preload("res://main/turrets/bullet.tscn")

@onready var head = $turret_visual/turret_head
@onready var timer = $shooting_timer

var damage = 1
var curr_targ

var enemies = []

func _physics_process(_delta):
	if enemies != []:
		curr_targ = enemies [0]
		head.look_at(curr_targ.global_position)

###

func _on_detection_area_area_entered(area):
	if area.is_in_group("Enemies"):
		enemies.push_back(area)
	if area.is_in_group("Turrets"):
		return
	if curr_targ != enemies [0]:
		timer.start()

func _on_detection_area_area_exited(area):
	if area.is_in_group("Enemies"):
		enemies.erase(area)

func shoot():
	var b = bullet.instantiate()
	
	get_parent().add_child(b)
	
	b.global_position = head.global_position
	
	b.vel = curr_targ.global_position - b.global_position

func _on_shooting_timer_timeout():
	if enemies != []:
		shoot()
		timer.start()
	elif enemies == []:
		timer.stop()
	
