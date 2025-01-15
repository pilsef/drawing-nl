extends FnGu

class_name FnGuCharacter

@export var rs_character : Resource
@export var is_selected = false

func exec():
	
	var color_primary
	var color_secondary

	if (is_selected):
		color_primary = Color.SKY_BLUE
		color_secondary = Color.WHITE
	else:
		color_primary = Color.YELLOW_GREEN
		color_secondary = Color.DARK_GREEN
		
	return decorated(
		[
			padgrounded_a(color_primary, 8),
			padgrounded_a(color_secondary, 4),
			padded_a(8)
		],
		img(rs_character.tex)
	).exec()
