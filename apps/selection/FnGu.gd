extends FnGu

var cursor : CursorGrid

func exec():	
	var arr_rq = cursor.arr.map(decorate_char)
	
	var name_char = cursor.item_selected.name
	var rq_name = scaled(2, textd(name_char))
	
	return decorated([
		padgrounded_a(Color.LIGHT_GRAY, 3),
		bordered(Color.BLACK, 10),
		scaled(3),
		with(rq_name, Pos.BOTTOM_MIDDLE, Dir.UP, Vector2(0, -6))
	], gridded(arr_rq, cursor.num_cols)).exec()

func decorate_char(chr):
	
	var rq = img(chr.tex)
	
	if chr == cursor.item_selected:
		rq = decorated([
			padgrounded_a(Color.WHITE, 2),
			bordered(Color.DARK_RED, 2),
			scaled(1.2)
		], rq)
	
	return embedded(Vector2(30,30), Pos.MIDDLE, Dir.NONE, Vector2(), rq)
