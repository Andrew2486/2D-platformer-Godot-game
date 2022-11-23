extends Area2D
export(String, FILE, "res://Scenes/Level_2_Scene.tscn") var next_scene_path

func change_scene(_next_scene := next_scene_path):
	get_tree().change_scene(_next_scene)


func _on_Exit_Point_body_entered(body):
	body = "Player"
	change_scene()
