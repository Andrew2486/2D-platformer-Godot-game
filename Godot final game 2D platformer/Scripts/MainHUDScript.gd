extends CanvasLayer


var score = 0 setget set_score
onready var lives = 3 setget set_lives
onready var timer = 0.00 setget set_time

func on_ready():
	Hud_visiblity_show()
	Hud_visiblity_hide()

func set_score(value):
	score = value
	$Hude_Node/Score.set_text("SCORE: "+str(score))
	pass

func set_lives(value):
	lives = value
	$Hude_Node/Lives.set_text(str(lives))
	death()
	pass
	
func set_time(value):
	timer = value
	$Hude_Node/Timer.set_text(str(timer))
	pass
func death():
	if lives < 0:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scenes/Death_screen_scene.tscn")

func Hud_visiblity_show():
	$Hude_Node.show()
	
func Hud_visiblity_hide():
	$Hude_Node.hide()
