extends Area2D

onready var spawn = get_parent().get_node("../Spawn_Location")


func _on_Area_of_Spike_body_entered(body):
	if body.name == "Player":
		body.position = spawn.position
		#body.position.x = 0 # puts player back at start after falling off the map
		#body.position.y = 0
		get_node("/root/MainHudScene").lives -= 1
		$AudioStreamPlayer.play()
		#free queue only one time use
	else:
		if body is TileMap:
			pass
		else:
			if body.is_in_group("Enemy"):
				body.queue_free()
