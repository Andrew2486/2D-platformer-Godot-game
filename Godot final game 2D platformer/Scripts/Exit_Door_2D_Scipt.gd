extends Area2D
onready var animation = $AnimationPlayer

func change_scene():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Level_2_Scene.tscn")
	
func _on_Exit_Door_2D_body_entered(body):
	if body.name == "Player":
		$Exit__Door_Animation.play("Open")
		animation.play("Fade_In")

func _on_AnimationPlayer_animation_finished(_anim_name):#animation name
	change_scene()
