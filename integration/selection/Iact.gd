extends IactBase

var pos_selected = Vector2i(0,0)
var idx_selected = 0
var num_cols = 4
var arr_characters : Array

func _input(ev: InputEvent) -> void:
	if ev is InputEventKey && ev.is_pressed():
		apply_keypress(ev)

func apply_keypress(ev:InputEventKey):
	if ev.keycode == KEY_RIGHT:
		shift_cursor(Vector2i.RIGHT)
	elif ev.keycode == KEY_LEFT:
		shift_cursor(Vector2i.LEFT)
	elif ev.keycode == KEY_UP:
		shift_cursor(Vector2i.UP)
	elif ev.keycode == KEY_DOWN:
		shift_cursor(Vector2i.DOWN)

func shift_cursor(amt):
	pos_selected += amt
	pos_selected.x = posmod(pos_selected.x, num_cols)
	pos_selected.y = posmod(pos_selected.y, get_num_rows())
	idx_selected = pos_selected.x + num_cols * pos_selected.y
	
	if (idx_selected >= arr_characters.size()):
		shift_cursor(amt)
	else:
		changed.emit()
	
func get_num_rows():
	return ceil(arr_characters.size() / (num_cols as float))
