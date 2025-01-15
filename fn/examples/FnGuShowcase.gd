extends FnGu

class_name FnGuShowcase

func exec():
	return gridded([
		scaled(0.5, FnGuRpgTextBox.new()),
		scaled(0.5, FnGuCharacterSelection.new()),
		scaled(3, img(load("res://tex/animals/croc.png"))),
		textd_multiline("The quick brown fox jumps over the lazy dog", 20),
		bordered(Color.BLACK, 4, FnGuRotatedSprites.new()),
		scaled(0.5, FnGuForm.new()),
		scaled(0.5, FnGuWikiPage.new()),
		tinted(Color.RED, img(load("res://tex/icon.png"))),
		rotated(15, FnGuHelloWorld.new())
	], 4).exec()
