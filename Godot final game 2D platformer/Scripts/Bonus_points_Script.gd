extends Node2D


func _on_Bonus_points_body_entered(body):
	if body.name == "Player":
		get_node("/root/MainHudScene").score += 25
		queue_free()
