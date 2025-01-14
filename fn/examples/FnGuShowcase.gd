extends FnGu

class_name FnGuShowcase

func exec():
	return gridded([
		scaled(0.5, FnGuRpgTextBox.new()),
		padgrounded_a(Color.BLACK, 10, img(load("res://tex/animals/bee.png"))),
		scaled(3, img(load("res://tex/animals/croc.png"))),
		rotated(15, FnGuHelloWorld.new()),
		textd_multiline("The quick brown fox jumps over the lazy dog", 20),
		scaled(0.5, FnGuWikiPage.new()),
		rotated(180, textd_multiline("Upside down text...\ncool!", 100)),
		img(load("res://tex/animals/pufferfish.png")),
		scaled(0.5, FnGuForm.new()),
		FnGuRotatedSprites.new(),
		scaled(0.5, FnGuCharacterSelection.new())
	], 4).exec()
