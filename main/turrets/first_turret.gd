extends Node2D

var bullet = preload("res://main/turrets/bullet.tscn")

@onready var bullet_spawn = $turret_visual/turret_head/pos/Marker2D
@onready var head = $turret_visual/turret_head
@onready var timer = $shooting_timer

var damage = 1
var curr_targ

var enemies = []

func _physics_process(_delta):
	if enemies != []:
		curr_targ = enemies [0]
		head.look_at(curr_targ.global_position)

func _on_detection_area_area_entered(area):
	if area.is_in_group("Enemies"):
		enemies.push_back(area)
		timer.start()

func _on_detection_area_area_exited(area):
	if area.is_in_group("Enemies"):
		enemies.erase(area)

func shoot():
	var b = bullet.instantiate()
	b.position = bullet_spawn.global_position
	
	b.vel = curr_targ.global_position - b.position
	
	get_parent().add_child(b)




func _on_shooting_timer_timeout():
	if enemies != []:
		shoot()
		timer.start()
	elif enemies == []:
		timer.stop()
	
