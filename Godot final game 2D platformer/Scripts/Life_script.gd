extends Area2D


func _on_Life_body_entered(body):
	if body.name == "Player":
		get_node("/root/MainHudScene").score += 5
		get_node("/root/MainHudScene").lives += 1
		queue_free()
