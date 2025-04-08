extends AppBase

var num_cols = 3
var idx_selected = 0

func ld():
	var arr = LoadUtil.load_resources_at("res://db/rs-character/")
	iact.cursor = CursorGrid.new(arr, num_cols, idx_selected)
