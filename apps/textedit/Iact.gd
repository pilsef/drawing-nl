extends IactBase

const UNICODE_LF = char(10)
const cursor_linger_time = 600

var time_cursor_flip = 0

var string
var cursor_visible = true

func _ready():
	time_cursor_flip = Time.get_ticks_msec() + cursor_linger_time

func _process(delta: float) -> void:	
	if (Time.get_ticks_msec() > time_cursor_flip):
		time_cursor_flip += cursor_linger_time
		set_param("cursor_visible", !cursor_visible)

func _input(ev: InputEvent) -> void:
	if ev is InputEventKey && ev.is_pressed():
		var string_new = apply_keypress_to_string(ev)
		
		if string != string_new:
			time_cursor_flip = Time.get_ticks_msec() + cursor_linger_time
			set_param("string", string_new)
			set_param("cursor_visible", true)

func apply_keypress_to_string(ev:InputEventKey):
	if ev.keycode == KEY_ENTER:
		return string + "\n" #UNICODE_LF
	elif ev.keycode == KEY_BACKSPACE:
		return string.substr(0, max(0, string.length() - 1))
	elif ev.unicode != 0:
		return string + char(ev.unicode)

	return string
