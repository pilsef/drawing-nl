extends FnGu

class_name FnGuCharacterPortrait

@export var rs_character : Resource

func exec():
	
	var name = rs_character.name
	
	return decorated(
		[
			scaled(3),
			padgrounded_hv(Color.DEEP_SKY_BLUE, 10, 20),
			bordered(Color.WHITE, 4),
			with(textd(name), Pos.BOTTOM_MIDDLE, Dir.DOWN, Vector2(0,10)),
		], 
		img(rs_character.tex)
	).exec()
