extends Fn

class_name FnGu

func exec():

	#return rq_nested.exec()

	var rq_draw_links = chained_text(
		[
			"Services", "About", "Company"
		],
		nested([
			scaled(2),
			padded_a(10),
			backgrounded(Color.WEB_GREEN),
			padded_a(10),
			backgrounded(Color.DARK_SLATE_GRAY)
		]),
		Vector2.RIGHT
	)
	
	var rq_draw_title = nested(
		[
			scaled(4),
			padded_h(10, 300)
		],
		from_textd("EveryPage")
	)
	
	var rq_header = backgrounded(Color.CADET_BLUE,
		chained_rq(
			[
				rq_draw_links,
				rq_draw_title
			],
			Vector2.LEFT
		)
	)
	
	var rq_blurb = chained_text(
		[
			"Superior Systems. We're the best in the biz.",
			"Since 1902, we've been providing the best consulting services.",
			"Reach out to a team member today to see how we can help YOU."
		],
		nested([
			scaled(2),
			padded_v(10, 0)
		]),
		Vector2.DOWN
	)
	
	var rq_page = chained_rq(
		[
			scaled(6, from_textd("Got Questions?")),
			from_space_v(10),
			scaled(3, from_textd("We've got answers")),
			from_space_v(20),
			rq_blurb
		], 
		Vector2.DOWN
	)
	
	return backgrounded(Color.DIM_GRAY, chained_rq(
		[
			rq_header, 
			from_space_v(150),
			rq_page,
			from_space_v(200)
		],
		Vector2.DOWN
	)).exec()

# top to bottom
static func nested(arr_rq_hierarchy:Array[Fn], rq_gu:Fn = null):
	var rq_nested = FnGuNested.new()
	rq_nested.arr_rq_hierarchy = arr_rq_hierarchy
	rq_nested.rq_gu = rq_gu
	return rq_nested

static func chained_rq(arr_rq_gu:Array, dir = Vector2.RIGHT):
	return chained(arr_rq_gu, FnGuFromRq, FnGuFromRq.new(), dir)
	
static func chained_tex(arr_rq_tex:Array, rq_nested_template:Fn, dir = Vector2.RIGHT):
	return chained(arr_rq_tex, FnGuFromTex, rq_nested_template, dir)
	
static func chained_text(arr_rq_text:Array, rq_nested_template:Fn, dir = Vector2.RIGHT):
	return chained(arr_rq_text, FnGuFromTextd, rq_nested_template, dir)

static func chained(
	arr_baselem:Array, class_baselem, rq_nested_template:Fn, dir = Vector2.RIGHT
) -> Fn:
	var rq_chain = FnGuChainNested.new()
	rq_chain.arr_baselem = arr_baselem
	rq_chain.class_baselem = class_baselem
	rq_chain.rq_nested_template = rq_nested_template
	rq_chain.dir = dir

	return rq_chain
	
static func chained_rq_2d(
	arr_rq_gu:Array, breadth_1d = 3,dir_1d = Vector2.RIGHT, dir_2d = Vector2.DOWN
):
	return chained_2d(
		arr_rq_gu, FnGuFromRq, FnGuFromRq.new(), breadth_1d, dir_1d, dir_2d
	)
	
static func chained_tex_2d(
	arr_rq_tex:Array, rq_nested_template:Fn, breadth_1d = 3, 
	dir_1d = Vector2.RIGHT, dir_2d = Vector2.DOWN
):
	return chained_2d(
		arr_rq_tex, FnGuFromTex, rq_nested_template, breadth_1d, dir_1d, dir_2d
	)
	
static func chained_text_2d(arr_rq_text:Array, rq_nested_template:Fn, breadth_1d = 3, 
	dir_1d = Vector2.RIGHT, dir_2d = Vector2.DOWN
):
	return chained_2d(
		arr_rq_text, FnGuFromTextd, rq_nested_template, breadth_1d, dir_1d, dir_2d
	)

static func chained_2d(
	arr_baselem:Array, class_baselem, rq_nested_template:Fn,
	breadth_1d = 3, dir_1d = Vector2.RIGHT, dir_2d = Vector2.DOWN
) -> Fn:
	var rq_chain_2d = FnGuChain2DNested.new()
	rq_chain_2d.arr_baselem = arr_baselem
	rq_chain_2d.class_baselem = class_baselem
	rq_chain_2d.rq_nested_template = rq_nested_template
	rq_chain_2d.breadth_1d = breadth_1d
	rq_chain_2d.dir_1d = dir_1d
	rq_chain_2d.dir_2d = dir_2d

	return rq_chain_2d
	
static func from_space_h(space) -> Fn:
	return from_color(Color(0,0,0,0), Vector2(space, 1))
	
static func from_space_v(space) -> Fn:
	return from_color(Color(0,0,0,0), Vector2(1, space))

static func from_color(color:Color, size:Vector2) -> Fn:
	var rq_gu = FnGuFromColor.new()
	rq_gu.color = color
	rq_gu.size = size
	return rq_gu

static func from_tex(tex:Texture) -> Fn:
	var rq_gu = FnGuFromTex.new()
	rq_gu.tex = tex
	return rq_gu
	
static func from_textd(txt:String) -> Fn:
	var rq_gu = FnGuFromTextd.new()
	rq_gu.txt = txt
	return rq_gu

static func backgrounded(color:Color, rq_gu:Fn = null) -> Fn:
	var rq_gu_backgrounded = FnGuBackgrounded.new()
	rq_gu_backgrounded.color = color
	rq_gu_backgrounded.rq_gu = rq_gu
	return rq_gu_backgrounded

static func padded(left, right, top, bottom, rq_gu:Fn = null) -> Fn:
	var rq_gu_padded = FnGuPadded.new()
	rq_gu_padded.left = left
	rq_gu_padded.top = top
	rq_gu_padded.right = right
	rq_gu_padded.bottom = bottom
	rq_gu_padded.rq_gu = rq_gu
	return rq_gu_padded

static func padded_a(amt, rq_gu:Fn = null):
	return padded(amt, amt, amt, amt, rq_gu);

static func padded_h(left, right, rq_gu:Fn = null):
	return padded(left, right, 0, 0, rq_gu);

static func padded_v(top, bottom, rq_gu:Fn = null):
	return padded(0, 0, top, bottom, rq_gu)

static func scaled(scale:int, rq_gu:Fn = null) -> Fn:
	var rq_gu_scaled = FnGuScaled.new()
	rq_gu_scaled.scale = scale
	rq_gu_scaled.rq_gu = rq_gu
	return rq_gu_scaled
