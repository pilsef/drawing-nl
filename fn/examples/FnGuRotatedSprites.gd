extends FnGu

class_name FnGuRotatedSprites

func exec():
	
	var rq_characters = map_img(
		[
			load("res://tex/animals/croc.png"),
			load("res://tex/animals/bee.png"),
			load("res://tex/animals/owl.png")
		],
		[bordered(Color(1, 0, 0, 0.5), -2)]
	)
	
	var rq_diag_sprites = chained(
		rq_characters,
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
