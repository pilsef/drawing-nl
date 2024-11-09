extends FnGu

class_name FnGuRpgTextBox

@export var text = "I hear there are GHOSTS in the graveyard!"

func exec():
	
	var rq_text = textd_multiline(text, 18)
	
	var rq_box = decorated(
		[
			bordered(Color.WHITE, 1),
			bordered(Color.BLACK, 1),
			bordered(Color.WHITE, 1),
			cornered(Color.WHITE, 4, 4),
			with(rq_text, Pos.TOP_LEFT, Dir.DOWN_RIGHT, Vector2(8,8)),
			scaled(4)
		],
		box(Color.BLACK, Vector2(160 - 6, 48 - 6))
	)
	
	return rq_box.exec()
