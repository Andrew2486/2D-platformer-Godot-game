extends Area2D


onready var Player = get_parent().get_node("../Player")




func _on_Area2D_body_entered(body):
	if body.name == "Player":
		Player.Shielding()
		queue_free()
