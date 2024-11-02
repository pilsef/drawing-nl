extends FnGu

class_name FnGuForm

func exec():
	
	var make_rq_textfield = func(string) :
		
		var rq_box = padgrounded_a(Color.DIM_GRAY, 2,
			box(Color.GHOST_WHITE, Vector2(250, 32))
		)
		
		return chained_rq(
			[
				tinted(Color.BLACK, textd(string)),
				space_v(6),
				rq_box
			]
		)
	
	var rq_textfields = chained_rq(
		[
			make_rq_textfield.call("First Name"),
			make_rq_textfield.call("Last Name"),
			make_rq_textfield.call("Email Address")
		],
		Pos.BOTTOM_LEFT * 1.3,
		Dir.DOWN_RIGHT
	)
	
	var rq_button = decorated(
		[
			padgrounded_hv(Color.ROYAL_BLUE, 20, 10),
			padgrounded_a(Color.BLACK, 3)
		],
		scaled(2, textd("Sign Up"))
	)
	
	var rq_content = chained_rq(
		[rq_textfields, space_v(40), rq_button],
		Pos.BOTTOM_MIDDLE, Dir.DOWN
	)
	
	return decorated(
		[
			padgrounded_hv(Color.FLORAL_WHITE, 20, 80),
			#padgrounded_a(Color.BLACK, 8),
			padgrounded_a(Color.BLACK, 10),
		], rq_content
	).exec()
