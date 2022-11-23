extends KinematicBody2D
var motion = Vector2()
const GRAVITY = 20
const SPEED = 200
onready var spawn = get_parent().get_node("../Spawn_Location")
onready var Player = get_parent().get_node("../Player")
var rotation_speed = rad2deg(-0.2) #how many degrees per second
var temp = rotation_degrees
var max_speed = 250


func _process(_delta):
	if visible == true:
		motion.y += GRAVITY
		if motion.x < max_speed and motion.y < max_speed:
#		motion.y += GRAVITY
			motion = move_and_slide(motion, Vector2(0, -1))
			rotate(rotation_speed * _delta)
		else:
			motion.y = max_speed
			motion = move_and_slide(motion, Vector2(0, -1))
			rotate(rotation_speed * _delta)

func _on_Bolder_Destroy_body_entered(body):
	if body.name == "Boulder":
		$AnimatedSprite.play("Breaking")


func _on_AnimatedSprite_animation_finished():
	queue_free()


func _on_Kill_Player_Area_body_entered(body):
	if body.name == "Player":
		body.position = spawn.position
		get_node("/root/MainHudScene").lives -= 1
		$AudioStreamPlayer.play()
