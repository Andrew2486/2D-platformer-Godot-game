extends Node2D


func _on_Steak_Pie_body_entered(body):
	if body.name == "Player":
		get_node("/root/MainHudScene").score += 5 #needs to be the scene
		queue_free()
