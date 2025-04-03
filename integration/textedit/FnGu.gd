extends FnGu

var string
var show_cursor = true

var color_bg = Color.WHITE
var color_border = Color.BLACK
var color_text = Color.BLACK

func exec():
	
	var cursor = "|" if show_cursor else " "; # note: non-breaking space
	
	return decorated(
		[
			tinted(color_text),
			scaled(3),
			padgrounded_a(color_bg, 20),
			bordered(color_border, 10)
		],
		textd_multiline(string + cursor, 40)
	).exec()
