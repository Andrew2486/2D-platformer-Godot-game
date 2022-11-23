extends Node2D

func _physics_process(_delta):
	$"/root/MainHudScene".Hud_visiblity_hide()
	OS.set_window_position(OS.get_screen_size()*0.5 - OS.get_window_size()*0.5)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Return_Button_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
# warning-ignore:return_value_discarded
			get_tree().change_scene("res://Scenes/Main_Menu.tscn")
