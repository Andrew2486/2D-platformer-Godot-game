extends Area2D


func _on_Checkpoint_1_body_entered(body):
	if body.name == "Player":
		#Move spawn_location to new location
		var spawn = get_parent().get_node("Spawn_Location")
		var check_1 = get_parent().get_node("Checkpoint_1")
		$Spawn_Location.set_position($Checkpoint_1.get_position_in_parent())
		
		
