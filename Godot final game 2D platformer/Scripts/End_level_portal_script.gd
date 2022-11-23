extends Area2D

func change_scene():
# warning-ignore:return_value_discarded
	if get_tree().root.has_node("Level_One_Node"):
		get_tree().change_scene("res://Scenes/Level_Two_Scene.tscn")
	elif get_tree().root.has_node("Level_Two_Node"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scenes/End_Game_Scene.tscn")

func _on_End_Portal_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite.play("Entered")
#
func _on_AnimatedSprite_animation_finished():
	change_scene()
#
#
