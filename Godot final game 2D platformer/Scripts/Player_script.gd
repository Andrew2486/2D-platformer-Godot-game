extends KinematicBody2D


export (float) var cooldown
signal shoot
const UP = Vector2(0, -1)
const SPEED = 200
const GRAVITY = 20 #20
const JUMP_HEIGHT = -500 #-500
const fireball = preload("res://Scenes/Fireball_scene.tscn")
const Rapid_fire_powerup = preload("res://Scenes/Rapid_Fire_Scene.tscn")
var motion = Vector2() # moving in 2d space
var fire_state = true
#var rate_of_fire = 0.5
onready var firerate = get_node("Fire_rate")


func _physics_process(_delta):
	motion.y += GRAVITY
	#Fixes timer loop starting as timer would always start true
	if Input.is_action_pressed("ui_down"):
		shoot()
		$AnimatedSprite.play("Fire")
	if Input.is_action_pressed("ui_left"):
		shoot()
		$AnimatedSprite.play("Fire")
	if Input.is_action_pressed("ui_up"):
		shoot()
		$AnimatedSprite.play("Fire")
	if Input.is_action_pressed("ui_right"):
		shoot()
		$AnimatedSprite.play("Fire")
	if Input.is_action_pressed("Move_Right"):
		$AnimatedSprite.flip_h = false #flip sprite to face direction
		motion.x = SPEED
		$AnimatedSprite.play("Run")
	elif Input.is_action_pressed("Move_Left"):
		$AnimatedSprite.flip_h = true #flip sprite to face direction
		motion.x = -SPEED
		$AnimatedSprite.play("Run")
	else:
		motion.x = 0
		$AnimatedSprite.play("Static")
	if is_on_floor():
		if Input.is_action_pressed("ui_select"):
			motion.y = JUMP_HEIGHT
	# use move_and_slide to create movement on screen
	motion = move_and_slide(motion, UP)


func shoot():
	if fire_state == true:
		fire_state = false
		$Fire_rate.start()
		var dir = Vector2(1, 0).rotated($AnimatedSprite.global_rotation)
		emit_signal('shoot', fireball, $AnimatedSprite.global_position, dir)

func _on_Fire_rate_timeout():
	#Change_wait_Time()
	fire_state = true


func Change_wait_Time(): #Changes rate of fire to 0.5 seconds instead of 1 second
		$Fire_rate.wait_time = 0.5
		$Rapid_Fire_Timmer.start()


func _on_Rapid_Fire_Timmer_timeout(): #Sets fire rate boost back to normal
	$Fire_rate.wait_time = 1
