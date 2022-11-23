extends Node2D
var fileExists = ("res://Scripts/MainHUDScript.gd")

func _physics_process(_delta):
	$"/root/MainHudScene".Hud_visiblity_show()
	OS.set_window_position(OS.get_screen_size()*0.5 - OS.get_window_size()*0.5)

func ready():
	if ResourceLoader.has_cached(fileExists):
# warning-ignore:return_value_discarded
		get_node("/root/MainHudScene")

func _on_Player_shoot(fireball, _position, _direction):
	var b = fireball.instance()
	add_child(b)
	b.start(_position, _direction)
