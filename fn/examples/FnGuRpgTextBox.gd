extends FnGu

class_name FnGuRpgTextBox

@export var text = "I hear there are GHOSTS in the graveyard!"

func exec():
	
	var rq_square = box(Color.WHITE, Vector2(4,4))
	
	var rq_text = textd_multiline(
		text,
		18
	)
	
	var rq_box = decorated(
		[
			padgrounded_a(Color.WHITE, 1),
			padgrounded_a(Color.BLACK, 1),
			padgrounded_a(Color.WHITE, 1),
			with(rq_square, Pos.TOP_LEFT, Dir.DOWN_RIGHT, Vector2()),
			with(rq_square, Pos.TOP_RIGHT, Dir.DOWN_LEFT, Vector2()),
			with(rq_square, Pos.BOTTOM_LEFT, Dir.UP_RIGHT, Vector2()),
			with(rq_square, Pos.BOTTOM_RIGHT, Dir.UP_LEFT, Vector2()),
			with(rq_text, Pos.TOP_LEFT, Dir.DOWN_RIGHT, Vector2(8,8)),
			scaled(4)
		],
		box(Color.BLACK, Vector2(160 - 6, 48 - 6))
	)
	
	return rq_box.exec()
