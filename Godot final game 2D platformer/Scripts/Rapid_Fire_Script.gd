extends Area2D

# onready var Player = get_parent().get_node("../Player")


func _on_Rapid_Fire_Area_body_entered(body):
	if body.name == "Player":
		var Player = get_parent().get_node("../Player")
		Player.Change_wait_Time()
		queue_free()
