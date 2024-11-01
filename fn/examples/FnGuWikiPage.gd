extends FnGu

class_name FnGuWikiPage

@export var tex_img = preload("res://tex/pufferfish.png")
@export var str_name = "Pufferfish"
@export var str_classification = "Aquatic creature"
@export var str_desc = "" \
	+ "The pufferfish is a water creature " \
	+ "capable of swimming at high speeds. " \
	+ "Don't approach the pufferfish or " \
	+ "else you will regret it."

func exec():

	var top_block = chained_rq(
		[
			scaled(2.5, textd("Yesterday")),
			space_v(20),
			scaled(1.5, textd("Featured Article")),
			space_v(4),
			scaled(1.5, textd("From English Wikipedia"))
		], Pos.BOTTOM_LEFT, Dir.DOWN_RIGHT
	)
	top_block = tinted(Color.BLACK, top_block)
	
	var rq_photo = decorated(
		[
			scaled(6),
			embedded(Color.SKY_BLUE, Vector2(340, 220)),
			padgrounded_a(Color.BLACK, 10)
		], img(tex_img)
	)
	
	var rq_description = chained_rq(
		[
			scaled(2, textd(str_name)),
			space_v(10),
			textd(str_classification),
			space_v(20),
			textd_multiline(str_desc, 36)
		]
	)
	rq_description = tinted(Color.BLACK, rq_description)
	
	var rq_content = chained_rq(
		[
			top_block,
			space_v(20),
			rq_photo, 
			space_v(20),
			padded(20, 0, 0, 0, rq_description)
		], Pos.BOTTOM_LEFT, Dir.DOWN_RIGHT
	)
	
	var rq_screen = padgrounded(Color.ANTIQUE_WHITE, 20, 20, 40, 40, rq_content)
	
	return padgrounded_hv(Color.BLACK, 20, 60, rq_screen).exec()
