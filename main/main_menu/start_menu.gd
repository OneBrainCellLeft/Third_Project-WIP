extends Control

func _process(_delta):
	if Utils.s1 == true:
		$"container-main_menu/g1".text = "Continue save 1"
		$"delete_menu/d1".visible = true
		$"delete_menu/d1".text = "X"
	elif Utils.s1 == false:
		$"container-main_menu/g1".text = "New Game"
		$"delete_menu/d1".visible = false
	
	if Utils.s2 == true:
		$"container-main_menu/g2".text = "Continue save 2"
		$"delete_menu/d2".visible = true
		$"delete_menu/d2".text = "X"
	elif Utils.s2 == false:
		$"container-main_menu/g2".text = "New Game"
		$"delete_menu/d2".visible = false
	
	if Utils.s3 == true:
		$"container-main_menu/g3".text = "Continue save 3"
		$"delete_menu/d3".visible = true
		$"delete_menu/d3".text = "X"
	elif Utils.s3 == false:
		$"container-main_menu/g3".text = "New Game"
		$"delete_menu/d3".visible = false

###

func _on_g_1_pressed():
	Utils.SAVE_PATH = "res://main/saves/save1.save"
	if Utils.s1 == true:
		Utils.Load_Game()
	elif Utils.s1 == false:
		get_tree().change_scene_to_file("res://main/maps/Tutorial/starter_area.tscn")

func _on_g_2_pressed():
	Utils.SAVE_PATH = "res://main/saves/save2.save"
	if Utils.s2 == true:
		Utils.Load_Game()
	elif Utils.s2 == false:
		get_tree().change_scene_to_file("res://main/maps/Tutorial/starter_area.tscn")

func _on_g_3_pressed():
	Utils.SAVE_PATH = "res://main/saves/save3.save"
	if Utils.s3 == true:
		Utils.Load_Game()
	elif Utils.s3 == false:
		get_tree().change_scene_to_file("res://main/maps/Tutorial/starter_area.tscn")

###

func _on_d_1_pressed():
	Utils.SAVE_PATH = "res://main/saves/save1.save"
	$delete_confirm.visible = true

func _on_d_2_pressed():
	Utils.SAVE_PATH = "res://main/saves/save2.save"
	$delete_confirm.visible = true

func _on_d_3_pressed():
	Utils.SAVE_PATH = "res://main/saves/save3.save"
	$delete_confirm.visible = true

###

func _on_yes_pressed():
	Utils.Delete_Game()
	$delete_confirm.visible = false


func _on_no_pressed():
	$delete_confirm.visible = false
