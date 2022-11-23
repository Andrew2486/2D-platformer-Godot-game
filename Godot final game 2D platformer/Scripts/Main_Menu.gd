extends Node2D

onready var HudFile = get_parent().get_node("/root/MainHudScene")
var fileExists = ("res://Scripts/MainHUDScript.gd")
#res://Scenes/MainHUDScene.tscn


func _physics_process(_delta):
	$"/root/MainHudScene".Hud_visiblity_hide()
	OS.set_window_position(OS.get_screen_size()*0.5 - OS.get_window_size()*0.5)

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Play_Button_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://Scenes/Level_One_Scene.tscn")
			get_node("/root/MainHudScene").lives = 3
			get_node("/root/MainHudScene").score = 0


# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Story_Button_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://Scenes/Story.tscn")


# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Exit_Button_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().quit()


# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_How_To_Button_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://Scenes/How_to_PLay_Scene.tscn")
