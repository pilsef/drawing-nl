extends FnGu

class_name FnGuHelloWorld

func exec():
	return decorated(
		[
			#tinted(Color.BLACK),
			scaled(4),
			padgrounded_a(Color.DARK_RED, 20),
			padgrounded_a(Color.BLACK, 20)
		],
		img(load("res://tex/pufferfish.png"))
	).exec()
