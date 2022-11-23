extends KinematicBody2D
export var fireball = preload("res://Scenes/Enemy_Fireball_scene.tscn")
onready var spawn = get_parent().get_node("../Spawn_Location")
onready var Player = get_parent().get_node("../Player")
onready var Raycast = get_node("Rays/RayCast2D")
const UP = Vector2(0, -1)
const SPEED = 100 #player = 200
const GRAVITY = 20
const JUMP_HEIGHT = -500
var motion = Vector2() # moving in 2d space
var target = null
var Fire_state = true

func _physics_process(_delta):
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
					Fire()

func Fire():
	if Fire_state == true:
		Fire_state = false
		$Fire_delay.start()
		var fire = fireball.instance()
		get_tree().get_root().call_deferred("add_child",fire)
		fire.global_position = global_position
		var dir = (Player.global_position - global_position).normalized()
		fire.global_rotation = dir.angle() + PI / 2
		fire.direction = dir


func _on_Area_of_sight_body_entered(body):
	if body.name == "Player":
		target = Player


func _on_Area_of_sight_body_exited(body):
	if body.name == "Player":
		target = null
		motion.x = 0
	
	
func movement():
	if target.position.x < position.x:
		$AnimatedSprite.flip_h = false
		motion.x = -SPEED
	elif target.position.x > position.x:
		$AnimatedSprite.flip_h = true 
		motion.x = SPEED
	else:
		motion.x = 0


func _on_Life_Removerer_body_entered(body):
	if body.name == "Player":
		body.position = spawn.position
		get_node("/root/MainHudScene").lives -= 1
		$AudioStreamPlayer.play()


func _on_Fire_delay_timeout():
	Fire_state = true
