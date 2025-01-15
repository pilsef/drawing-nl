extends FnGu

var string
var color_bg = Color.BLACK

func exec():
	return decorated(
		[
			scaled(3),
			padded_a(20),
			bordered(Color.DARK_RED, 20),
			rotated(-15),
			backgrounded(color_bg)
		],
		textd_multiline(string + "|", 40)
	).exec()
