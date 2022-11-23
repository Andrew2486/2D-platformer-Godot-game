extends KinematicBody2D

func _on_Steak_Pie_body_entered(body):
	if body.name == "Player":
		$Animate_Door.play("open")
		#get_node("Door_Collisoin").disabled = true
		get_node ("Door_Collisoin").queue_free()
