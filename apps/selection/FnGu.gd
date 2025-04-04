extends FnGu

var idx_selected : int
var arr_characters : Array
var num_cols : int

func exec():	
	
	var arr_rq = Array()
	arr_rq.resize(arr_characters.size())
	
	for i in arr_characters.size():
		arr_rq[i] = decorate_char(arr_characters[i], i == idx_selected)
	
	var name_char = arr_characters[idx_selected].name
	var rq_name = scaled(2, textd(name_char))
	
	return decorated([
		padgrounded_a(Color.LIGHT_GRAY, 3),
		bordered(Color.BLACK, 10),
		scaled(3),
		with(rq_name, Pos.BOTTOM_MIDDLE, Dir.UP, Vector2(0, -6))
	], gridded(arr_rq, num_cols)).exec()

func decorate_char(chr, is_selected):
	
	var rq = img(chr.tex)
	
	if is_selected:
		rq = decorated([
			padgrounded_a(Color.WHITE, 2),
			bordered(Color.DARK_RED, 2),
			scaled(1.2)
		], rq)
	
	return embedded(Vector2(30,30), Pos.MIDDLE, Dir.NONE, Vector2(), rq)
