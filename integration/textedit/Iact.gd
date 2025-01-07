extends IactBase

const UNICODE_LF = char(10)

var string

func _input(ev: InputEvent) -> void:
	if ev is InputEventKey && ev.is_pressed():
		var string_new = apply_keypress_to_string(ev)
		set_param("string", string_new)

func apply_keypress_to_string(ev:InputEventKey):
	if ev.keycode == KEY_ENTER:
		return string + "\n" #UNICODE_LF
	elif ev.keycode == KEY_BACKSPACE:
		return string.substr(0, max(0, string.length() - 1))
	elif ev.unicode != 0:
		return string + char(ev.unicode)

	return string
