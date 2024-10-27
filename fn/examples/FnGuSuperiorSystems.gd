extends FnGu

func exec():
	var rq_draw_links = chained_text(
		[
			"Services", "About", "Company"
		],
		decorated([
			scaled(2),
			padded_a(10),
			backgrounded(Color.WEB_GREEN),
			padded_a(10),
			backgrounded(Color.DARK_SLATE_GRAY)
		])
	)
	
	var rq_draw_title = decorated(
		[
			scaled(4),
			padded_h(10, 300)
		],
		textd("Superior Systems")
	)
	
	var rq_header = backgrounded(Color.CADET_BLUE,
		chained_rq(
			[
				rq_draw_links,
				rq_draw_title
			],
			Pos.LEFT_MIDDLE, Dir.LEFT
		)
	)
	
	var rq_blurb = chained_text(
		[
			"Superior Systems. We're the best in the biz.",
			"Since 1902, we've been providing the best consulting services.",
			"Reach out to a team member today to see how we can help YOU."
		],
		decorated([
			scaled(2),
			padded_v(10, 0)
		]),
		Pos.BOTTOM_LEFT, Dir.DOWN_RIGHT
	)
	
	var rq_page = chained_rq(
		[
			scaled(6, textd("Got Questions?")),
			space_v(10),
			scaled(3, textd("We've got answers")),
			space_v(20),
			rq_blurb
		], 
		Pos.BOTTOM_MIDDLE, Dir.DOWN
	)
	
	return backgrounded(Color.DIM_GRAY, chained_rq(
		[
			rq_header, 
			space_v(150),
			rq_page,
			space_v(200)
		],
		Pos.BOTTOM_MIDDLE, Dir.DOWN
	)).exec()
