extends Node2D #needs to be the script


func _on_Butter_chicken_pie_body_entered(body):
	if body.name == "Player":
		get_node("/root/MainHudScene").score += 5 #needs to be the scene
		queue_free()
