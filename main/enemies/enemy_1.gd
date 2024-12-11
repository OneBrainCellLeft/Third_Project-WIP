extends Node2D

var HP = 1


func _process(_delta):
	get_parent().set_progress(get_parent().get_progress() + 0.4)
	if get_parent().get_progress_ratio() == 1:
		queue_free()
	death()


func death():
	if HP <= 0:
		Utils.coins += 1
		queue_free()


func _on_colissions_body_entered(body):
	if body.is_in_group("weak_bullets"):
		HP -= 1
		body.queue_free()
