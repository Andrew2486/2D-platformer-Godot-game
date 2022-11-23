extends KinematicBody2D
onready var spawn = get_parent().get_node("../Spawn_Location")
onready var Player = get_parent().get_node("../Player")
onready var Raycast = get_node("Rays/RayCast2D")
export var fireball = preload("res://Scenes/Enemy_Fireball_scene.tscn")
var Fire_state = true
var target = null

func _physics_process(_delta):
	if target != null: #checks target values (null = no fire, player = fire)
		Raycast.set_cast_to(target.global_position - Raycast.global_position) #sets raycast target
		if Raycast.is_colliding() == true:
			var collider = Raycast.get_collider()
			if collider != null and collider.name == "Player":
				#print("Player_Detected")
				sprite_flip()
				Fire()

func _on_Life_remover_body_entered(body):
	if body.name == "Player":
		body.position = spawn.position
		get_node("/root/MainHudScene").lives -= 1
		$AudioStreamPlayer.play()


func Fire():
	if Fire_state == true:
		Fire_state = false
		$Fire_Delay.start()
		var fire = fireball.instance()
		get_tree().get_root().call_deferred("add_child",fire)
		fire.global_position = global_position
		var dir = (Player.global_position - global_position).normalized()
		fire.global_rotation = dir.angle() + PI / 2
		fire.direction = dir


func _on_Fire_Delay_timeout():
	Fire_state = true



func _on_Area2D_body_entered(body): #set a radius for enemy to attack player
	if body.name == "Player":
		target = Player
		
	

func _on_Area2D_body_exited(body): #target becomes null when player leaves radius of circle
	if body.name == "Player":
		target = null
	
	
func sprite_flip():
	if Player.position.x > position.x:
		$AnimatedSprite.flip_h = false #flip sprite to face direction
	elif Player.position.x < position.x:
		$AnimatedSprite.flip_h = true 




func _on_AnimatedSprite_animation_finished():
	#queue_free()
	pass
	
	



#func _on_Worm_tree_exited():
#	if self.queue_free():
#		$AnimatedSprite.play("Death")
	
	
	
# death animation for worm
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	#backup code
#onready var spawn = get_parent().get_node("../Spawn_Location")
#onready var Player = get_parent().get_node("../Player")
#onready var Raycast = get_node("Rays/RayCast2D")
#export var fireball = preload("res://Scenes/Enemy_Fireball_scene.tscn")
#var Fire_state = true
#
#func _physics_process(_delta):
#	Raycast.set_cast_to(Player.global_position - Raycast.global_position)
#	if Raycast.is_colliding() == true:
#		var collider = Raycast.get_collider()
#		if collider != null and collider.name == "Player":
#			print("Player_Detected")
#			Fire()
#
#func _on_Life_remover_body_entered(body):
#	if body.name == "Player":
#		body.position = spawn.position
#		get_node("/root/MainHudScene").lives -= 1
#		$AudioStreamPlayer.play()
#
#
#func Fire():
#	if Fire_state == true:
#		Fire_state = false
#		$Fire_Delay.start()
#		var fire = fireball.instance()
#		get_tree().get_root().call_deferred("add_child",fire)
#		fire.global_position = global_position
#		var dir = (Player.global_position - global_position).normalized()
#		fire.global_rotation = dir.angle() + PI / 2
#		fire.direction = dir
#
#
#func _on_Fire_Delay_timeout():
#	Fire_state = true
