extends Fn

class_name FnGu

func exec():
	
	var rq_nested = nested([
			scaled(4),
			padded_a(10),
			backgrounded(Color.WEB_GREEN),
			padded_a(10),
			backgrounded(Color.DARK_SLATE_GRAY)
		]
	)
	
	#return rq_nested.exec()
	
	return chained(
		[
			#load("res://tex/pufferfish.png"),
			#load("res://tex/snake.png"),
			#load("res://tex/monkey.png"),
			#load("res://tex/owl.png"),
			#load("res://tex/pelican.png"),
			"owl", "pufferfish", "snake", "monkey", "pelican"
		],
		FnGuFromTextd,
		rq_nested,
		Vector2.RIGHT
	).exec()

# top to bottom
static func nested(arr_rq_hierarchy:Array[Fn], rq_gu:Fn = null):
	var rq_nested = FnGuNested.new()
	rq_nested.arr_rq_hierarchy = arr_rq_hierarchy
	rq_nested.rq_gu = rq_gu
	return rq_nested

static func chained(
	arr_baselem:Array, class_baselem, rq_nested_template:Fn, dir = Vector2(0,1)
) -> Fn:
	var rq_chain = FnGuChainNested.new()
	rq_chain.arr_baselem = arr_baselem
	rq_chain.class_baselem = class_baselem
	rq_chain.rq_nested_template = rq_nested_template
	rq_chain.dir = dir

	return rq_chain

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
