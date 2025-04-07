extends Resource

class_name CursorGrid

var arr : Array
var num_cols : int

var pos_selected : Vector2i

var idx_selected : int :
	get: return pos_selected.x + num_cols * pos_selected.y
	set(idx):
		pos_selected = Vector2(
			idx % num_cols,
			idx / num_cols
		)

var num_rows : int :
	get: return ceil(arr.size() / (num_cols as float))
	
var item_selected :
	get: return arr[idx_selected]
	
func _init(arr, num_cols, idx_selected = 0):
	self.arr = arr
	self.num_cols = num_cols
	self.idx_selected = idx_selected

func shift(amt : Vector2i):
	pos_selected += amt
	pos_selected.x = posmod(pos_selected.x, num_cols)
	pos_selected.y = posmod(pos_selected.y, num_rows)
	
	if (idx_selected >= arr.size()):
		shift(amt)
