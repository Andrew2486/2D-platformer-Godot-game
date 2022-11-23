extends Area2D
export var respawn = preload("res://Scenes/Spawn_Location_scene.tscn")
var motion = Vector2()
var SPEED = 200
var direction : Vector2 = Vector2.LEFT



func _physics_process(delta):
		translate(direction * SPEED * delta)



func _on_Enemy_bullet_body_entered(body):
	if body.name == "Player":
		if get_tree().root.has_node("Level_One_Node"):
			var spawn = get_parent().get_node("Level_One_Node/Spawn_Location")
			body.position = spawn.position
		elif get_tree().root.has_node("Level_Two_Node"):
			var spawn2 = get_parent().get_node("Level_Two_Node/Spawn_Location")
			body.position = spawn2.position
		get_node("/root/MainHudScene").score -= 5
		get_node("/root/MainHudScene").lives -= 1
		$AudioStreamPlayer.play()
		return
	if body is TileMap:
		queue_free()
		
		
		
		
		
		
		
#		if body.name == "Player":
#		if spawn:
#			body.position = spawn.position
#		else:
#			body.position = spawn2.position
#		get_node("/root/MainHudScene").score -= 5
#		get_node("/root/MainHudScene").lives -= 1
#		$AudioStreamPlayer.play()
#		return
#	if body is TileMap:
#		queue_free()



