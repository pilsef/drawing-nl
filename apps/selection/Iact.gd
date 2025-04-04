extends IactBase

var pos_selected = Vector2i(0,0)

var idx_selected = 0
var arr_characters : Array
var num_cols = 4

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
	pos_selected += amt
	pos_selected.x = posmod(pos_selected.x, num_cols)
	pos_selected.y = posmod(pos_selected.y, get_num_rows())
	var idx_selected_new = pos_selected.x + num_cols * pos_selected.y
	
	if (idx_selected_new >= arr_characters.size()):
		shift_cursor(amt)
	else:
		set_param("idx_selected", idx_selected_new)
	
func get_num_rows():
	return ceil(arr_characters.size() / (num_cols as float))
