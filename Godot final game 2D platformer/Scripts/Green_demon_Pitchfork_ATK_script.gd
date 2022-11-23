extends KinematicBody2D

onready var spawn = get_parent().get_node("../Spawn_Location")
onready var Player = get_parent().get_node("../Player")
onready var Raycast = get_node("Rays/RayCast2D")
const UP = Vector2(0, -1)
const SPEED = 160 #player = 200
const GRAVITY = 20
const JUMP_HEIGHT = -500
const jump_delay = 300
var motion = Vector2() # moving in 2d space
var target = null
var jump_timer = 0



func _physics_process(_delta): #physics_proDeath_Sound()cess updates every cycle
	motion.y += GRAVITY
	motion = move_and_slide(motion, Vector2(0, -1))
	if target != null: #checks target values (null = no fire, player = fire)
		Raycast.set_cast_to(target.global_position - Raycast.global_position) #sets raycast target
		if Raycast.is_colliding() == true:
			var collider = Raycast.get_collider()
			if collider != null and collider.name == "Player":				
				_on_Area_of_sight_body_entered(target)
				if target:
					movement()
					if target.position.y < position.y - 64 and is_on_floor():
						jump_timer = OS.get_ticks_msec() + jump_delay  #need to dealy jumps
						motion.y = JUMP_HEIGHT
	

func _on_Life_remover_body_entered(body):
	if body.name == "Player":
		body.position = spawn.position
		get_node("/root/MainHudScene").lives -= 1
		$AudioStreamPlayer.play()


func _on_Area_of_sight_body_entered(body):
	if body.name == "Player":
		target = Player


func _on_Area_of_sight_body_exited(body):
	if body.name == "Player":
		target = null
		motion.x = 0
		

func movement():
	if target.position.x < position.x:
		$AnimatedSprite.flip_h = false #flip sprite to face direction
		motion.x = -SPEED
	elif target.position.x > position.x:
		$AnimatedSprite.flip_h = true 
		motion.x = SPEED
	else:
		motion.x = 0
