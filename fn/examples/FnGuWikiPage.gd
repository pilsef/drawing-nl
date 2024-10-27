extends FnGu

class_name FnGuWikiPage

@export var tex_img = load("res://tex/pufferfish.png")
@export var str_name = "Pufferfish"
@export var str_classification = "Aquatic creature"
@export var arr_desc = [
	"The pufferfish is a water creature",
	"capable of swimming at high speeds.",
	"Don't approach the pufferfish or",
	"else you will regret it."
]

func exec():

	var top_block = chained_rq(
		[
			scaled(4, textd("Yesterday")),
			space_v(20),
			scaled(2, textd("Featured Article")),
			space_v(4),
			scaled(2, textd("From English Wikipedia"))
		], Pos.BOTTOM_LEFT, Dir.DOWN_RIGHT
	)
	
	var rq_photo = decorated(
		[
			scaled(6),
			#padded(150, 150, 80, 80),
			embedded_abs(Color.DARK_RED, Vector2(400, 240))
		], tex(tex_img)
	)
	
	var rq_description = chained_rq(
		[
			scaled(2, textd(str_name)),
			space_v(10),
			textd(str_classification),
			space_v(20),
			chained_text(
				arr_desc,
				padded_v(0, 4)
			)
		]
	)
	
	var rq_content = chained_rq(
		[
			top_block,
			space_v(20),
			rq_photo, 
			space_v(20),
			padded(20, 0, 0, 0, rq_description)
		], Pos.BOTTOM_LEFT, Dir.DOWN_RIGHT
	)
	
	return embedded_rel(Color.BLACK, 20, 20, 40, 40, rq_content).exec()
