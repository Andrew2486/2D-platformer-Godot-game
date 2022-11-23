extends Area2D

export (float) var lifetime
var motion = Vector2()
var SPEED = 600
var timeOut = 1


func start(_position, _direction):
	#Run and unputs first otherwise they will never be run
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_right"): #working
		$AnimatedSprite.rotation = 5.5
		position = _position
		motion.y = -SPEED# Shoots up and right
		motion.x = SPEED
		return
		
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_right"): #working
		$AnimatedSprite.rotation = 7
		position = _position
		motion.y = SPEED
		motion.x = SPEED#Down and right
		return
		
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_left"): #working
		$AnimatedSprite.rotation = 2
		position = _position
		motion.y = SPEED
		motion.x = -SPEED#Down and left
		return
		
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_left"): #working
		$AnimatedSprite.rotation = 4
		position = _position
		motion.y = -SPEED
		motion.x = -SPEED#Up and left
		return
		
	if	Input.is_action_pressed("ui_left"): #working
		$AnimatedSprite.flip_h = true
		position = _position
		motion = _direction * -SPEED #Shoots left
		return
		
	if Input.is_action_pressed("ui_right"): #working
		position = _position
		motion = _direction * SPEED #Shoots right
		return
		
	if Input.is_action_pressed("ui_up"): #working
		$AnimatedSprite.rotation = 23.5
		position = _position
		motion.y = -SPEED #Shoots up
		return
	
	if Input.is_action_pressed("ui_down"): #working
		$AnimatedSprite.rotation = 1.5
		position = _position
		motion.y = SPEED #shoots down
		return
	
	else:
		queue_free()
		

func _physics_process(delta):
	position += motion * delta
	
	
func _on_Fireball_body_entered(body):
	if body.is_in_group("Enemy"):
		get_node("/root/MainHudScene").score += 5
		body.queue_free() #Removes Enemy
		explode()
		return
	if body is TileMap:
		explode()

		
func explode():
	motion = Vector2()
	$AnimatedSprite.hide()
	$Explode.show()
	$Explode.play("Explosion")

func _on_timeOut_timeout():
#	 #fire travels for 1 second before been deleted
	explode()
#
func _on_Explode_animation_finished():
	queue_free()
