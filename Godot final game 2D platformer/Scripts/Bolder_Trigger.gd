extends Area2D
onready var Player = get_parent().get_node("../Player")
onready var Boulder = get_parent().get_node("Boulder")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		Player = body
		Boulder.show()
		$CollisionShape2D.queue_free() #Stops crash if player returns
