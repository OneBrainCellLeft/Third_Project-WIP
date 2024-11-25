extends Node

var saveium = 0

var s1 = false
var s2 = false
var s3 = false
var SAVE_PATH

###

func _process(_delta):
	Save_Check()

###

func Save_Game():
	saveium += 1
	var save_file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data = {
	"Saveium" : saveium,
	}
	var jstr = JSON.stringify(data)
	save_file.store_line(jstr)

###

func Load_Game():
	var save_file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH):
		if not save_file.eof_reached():
			var current_line = JSON.parse_string(save_file.get_line())
			if current_line:
				saveium = current_line["Saveium"]

###

func Delete_Game():
	DirAccess.remove_absolute(SAVE_PATH)

###

func Save_Check():
	if FileAccess.file_exists("res://main/saves/save1.save"):
		s1 = true
	if not FileAccess.file_exists("res://main/saves/save1.save"):
		s1 = false
	
	if FileAccess.file_exists("res://main/saves/save2.save"):
		s2 = true
	if not FileAccess.file_exists("res://main/saves/save2.save"):
		s2 = false
	
	if FileAccess.file_exists("res://main/saves/save3.save"):
		s3 = true
	if not FileAccess.file_exists("res://main/saves/save3.save"):
		s3 = false
