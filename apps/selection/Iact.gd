extends IactBase

var cursor : CursorGrid

func on_key_press(ev:InputEventKey):
	if ev.keycode == KEY_RIGHT:
		shift_cursor(Vector2i.RIGHT)
	elif ev.keycode == KEY_LEFT:
		shift_cursor(Vector2i.LEFT)
	elif ev.keycode == KEY_UP:
		shift_cursor(Vector2i.UP)
	elif ev.keycode == KEY_DOWN:
		shift_cursor(Vector2i.DOWN)

func shift_cursor(amt):
	cursor.shift(amt)
	changed.emit()
