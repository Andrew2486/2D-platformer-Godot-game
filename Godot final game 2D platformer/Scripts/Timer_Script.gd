extends Label

var time_passed := 0.0

func _process(delta) -> void:
	time_passed += delta
