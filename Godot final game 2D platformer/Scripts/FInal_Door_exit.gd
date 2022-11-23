extends Area2D
onready var animation = $AnimationPlayer

func change_scene():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/End_Game_Scene.tscn")

func _on_AnimationPlayer_animation_finished(_anim_name):
	change_scene()


func _on_FInal_Door_exit_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite.play("open")
		animation.play("New Anim")
