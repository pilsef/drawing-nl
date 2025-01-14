extends FnGu

class_name FnGuRotatedSprites

func exec():
	return scaled(4, rotated(245, chained_img(
		[
			load("res://tex/animals/croc.png"),
			load("res://tex/animals/bee.png"),
			load("res://tex/animals/owl.png")
		],
		decorated([
			bordered(Color(1, 0, 0, 0.5), -2)
		]),
		Pos.TOP_LEFT,
		Dir.LEFT
	))).exec()
