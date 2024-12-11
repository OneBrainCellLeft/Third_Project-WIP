extends Node2D

var turret_1 = load("res://main/turrets/first_turret.tscn")
var empty = true

@onready var ui = $ui_spawner
@onready var ft = $ui_spawner/Control/VBoxContainer/first_turret
@onready var st = $ui_spawner/Control/VBoxContainer/second_turret
@onready var tt = $ui_spawner/Control/VBoxContainer/third_turret

func _ready():
	turret_check()


func spawn_t1():
	var t_1 = turret_1.instantiate()
	
	add_child(t_1)
	
	empty = false

func _on_shop_button_pressed():
	if empty == true:
		ui.visible = true
	elif empty == false:
		pass

func _on_first_turret_pressed():
	if Utils.coins >= 10:
		spawn_t1() 
		Utils.coins -= 10
		ui.visible = false
	else:
		pass

func _on_second_turret_pressed():
	pass 

func _on_third_turret_pressed():
	pass 

func _on_close_pressed():
	ui.visible = false

func turret_check():
	if Utils.stage >= 0:
		ft.text = "$10 - First Turret"
		st.text = "???"
		st.disabled = true
		tt.text = "???"
		tt.disabled = true
	if Utils.stage >= 2:
		ft.text = "$10 - First Turret"
		st.text = "$20 - Second Turret"
		st.disabled = false
		tt.text = "???"
		tt.disabled = true
	if Utils.stage >= 3:
		ft.text = "$10 - First Turret"
		st.text = "$20 - Second Turret"
		st.disabled = false
		tt.text = "$30 - Third Turret"
		tt.disabled = false

