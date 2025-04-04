extends IactBase

class_name IactLightbulb

var is_on

func on_key_release(event: InputEventKey):
	if event.keycode == KEY_K:
		set_param("is_on", !is_on)
