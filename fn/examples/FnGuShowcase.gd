extends FnGu

class_name FnGuShowcase

func exec():
	var arr_rq_base = [
		scaled(0.5, FnGuRpgTextBox.new()),
		scaled(0.5, FnGuCharacterSelection.new()),
		scaled(3, img(load("res://tex/animals/croc.png"))),
		textd_multiline("The quick brown fox jumps over the lazy dog", 20),
		bordered(Color.BLACK, 4, FnGuRotatedSprites.new()),
		scaled(0.5, FnGuForm.new()),
		scaled(0.5, FnGuWikiPage.new()),
		tinted(Color.RED, img(load("res://tex/icon.png"))),
		rotated(15, FnGuHelloWorld.new()),
		#FnGuMenu.new(),
		sized_c(Vector2(200,100), img(load("res://tex/animals/dall-sheep.png")))
	]
	
	var arr_rq = arr_rq_base.map(
		func(rq_base):
			return bordered(Color.RED, 2, rq_base)
	)
	
	var rq_grid = gridded(arr_rq, 4);
	
	return backgrounded(Color(0.2,0.2,0.2), rq_grid).exec()
