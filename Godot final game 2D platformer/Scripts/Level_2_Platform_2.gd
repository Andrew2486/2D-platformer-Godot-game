extends Area2D


func _on_Area2D_body_entered(_body):
	$AnimationPlayer.play("Set_3_2")
