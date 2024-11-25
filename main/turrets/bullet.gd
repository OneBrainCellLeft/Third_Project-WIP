extends CharacterBody2D

var vel = Vector2(1, 0)
var speed = 800

func _physics_process(delta):
	move_and_collide(vel.normalized() * delta * speed)
	
