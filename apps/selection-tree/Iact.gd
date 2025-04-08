extends IactBase

var cursor : CursorTree

func on_key_press(ev: InputEventKey):
	if ev.keycode == KEY_RIGHT:
		change(cursor.shift(1))
	elif ev.keycode == KEY_LEFT:
		change(cursor.shift(-1))
	elif ev.keycode == KEY_UP:
		change(cursor.surface())
	elif ev.keycode == KEY_DOWN:
		change(cursor.delve(1))
