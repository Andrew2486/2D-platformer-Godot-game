extends Area2D


func _on_Player_Trigger_Platform_body_entered(_body):
	$AnimationPlayer.play("Secret_Animation_1")
