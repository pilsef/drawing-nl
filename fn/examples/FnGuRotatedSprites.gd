extends FnGu

class_name FnGuRotatedSprites

func exec():
	
	var rq_diag_sprites = chained_img(
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
	)
	
	return decorated(
		[
			bordered(Color.BLACK, 4),
			rotated(245),
			scaled(4)
		], 
		rq_diag_sprites
	).exec()
