extends Node2D

func _physics_process(_delta):
	$"/root/MainHudScene".Hud_visiblity_hide()
	OS.set_window_position(OS.get_screen_size()*0.5 - OS.get_window_size()*0.5)
	
# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://Scenes/Main_Menu.tscn")
