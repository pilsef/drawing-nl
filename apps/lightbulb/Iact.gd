extends IactBase

class_name IactLightbulb

var is_on

func _input(event: InputEvent) -> void:
	if event is InputEventKey && event.keycode == KEY_K && event.is_released():
		set_param("is_on", !is_on)
