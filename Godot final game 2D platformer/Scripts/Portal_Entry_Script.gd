extends Area2D
#onready var Teleport = get_parent().get_node("Portal_Exit")
#onready var Teleport_2 = get_parent().get_node("Portal_Exit_2")
#onready var Teleport_3 = get_parent().get_node("Portal_Exit_3")


func _on_Portal_Entry_body_entered(body):
	if body.name == "Player":
		var Teleport = get_parent().get_node("Portal_Exit")
		body.position = Teleport.position


func _on_Portal_Entry_2_body_entered(body):
	if body.name == "Player":
		var Teleport_2 = get_parent().get_node("Portal_Exit_2")
		body.position = Teleport_2.position


func _on_Portal_Entry_3_body_entered(body):
	if body.name == "Player":
		var Teleport_3 = get_parent().get_node("Portal_Exit_3")
		body.position = Teleport_3.position
