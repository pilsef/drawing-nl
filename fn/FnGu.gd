extends Fn

class_name FnGu

func exec():
	
	return
	


# top to bottom
static func decorated(arr_rq_hierarchy:Array[Fn], rq_gu:Fn = null):
	var rq_decorated = FnGuDecorated.new()
	rq_decorated.arr_rq_hierarchy = arr_rq_hierarchy
	rq_decorated.rq_gu = rq_gu
	return rq_decorated

static func chained_rq(
	arr_rq_gu:Array, pos = Pos.BOTTOM_LEFT, dir = Dir.DOWN_RIGHT
):
	return chained(arr_rq_gu, FnGuFromRq, FnGuFromRq.new(), pos, dir)
	
static func chained_tex(
	arr_tex:Array, rq_decorated_unbound:Fn, 
	pos = Pos.TOP_RIGHT, dir = Dir.DOWN_RIGHT
):
	return chained(arr_tex, FnGuFromTex, rq_decorated_unbound, pos, dir)
	
static func chained_text(
	arr_text:Array, rq_decorated_unbound:Fn,
	pos = Pos.BOTTOM_LEFT, dir = Dir.DOWN_RIGHT
):
	return chained(arr_text, FnGuFromTextd, rq_decorated_unbound, pos, dir)

static func chained(
	arr_baselem:Array, class_baselem, rq_decorated_unbound:Fn, 
	pos = Pos.TOP_RIGHT, dir = Dir.DOWN_RIGHT
) -> Fn:
	var rq_chain = FnGuChainDecorated.new()
	rq_chain.arr_baselem = arr_baselem
	rq_chain.class_baselem = class_baselem
	rq_chain.rq_decorated_unbound = rq_decorated_unbound
	rq_chain.pos = pos
	rq_chain.dir = dir

	return rq_chain
	
static func chained_rq_2d(
	arr_rq_gu:Array, breadth_1d = 3,
	pos_1d = Pos.TOP_RIGHT, dir_1d = Dir.DOWN_RIGHT, 
	pos_2d = Pos.BOTTOM_LEFT, dir_2d = Dir.DOWN_RIGHT
):
	return chained_2d(
		arr_rq_gu, FnGuFromRq, FnGuFromRq.new(), breadth_1d,
		pos_1d, dir_1d, pos_2d, dir_2d
	)
	
static func chained_tex_2d(
	arr_rq_tex:Array, rq_decorated_unbound:Fn, breadth_1d = 3, 
	pos_1d = Pos.TOP_RIGHT, dir_1d = Dir.DOWN_RIGHT, 
	pos_2d = Pos.BOTTOM_LEFT, dir_2d = Dir.DOWN_RIGHT
):
	return chained_2d(
		arr_rq_tex, FnGuFromTex, rq_decorated_unbound, breadth_1d,
		pos_1d, dir_1d, pos_2d, dir_2d
	)
	
static func chained_text_2d(
	arr_rq_text:Array, rq_decorated_unbound:Fn, breadth_1d = 3, 
	pos_1d = Pos.TOP_RIGHT, dir_1d = Dir.DOWN_RIGHT, 
	pos_2d = Pos.BOTTOM_LEFT, dir_2d = Dir.DOWN_RIGHT
):
	return chained_2d(
		arr_rq_text, FnGuFromTextd, rq_decorated_unbound, breadth_1d,
		pos_1d, dir_1d, pos_2d, dir_2d
	)

static func chained_2d(
	arr_baselem:Array, class_baselem, rq_decorated_unbound:Fn, breadth_1d = 3, 
	pos_1d = Pos.TOP_RIGHT, dir_1d = Dir.DOWN_RIGHT, 
	pos_2d = Pos.BOTTOM_LEFT, dir_2d = Dir.DOWN_RIGHT
) -> Fn:

	var rq_chain_2d = FnGuChain2dDecorated.new()
	rq_chain_2d.arr_baselem = arr_baselem
	rq_chain_2d.class_baselem = class_baselem
	rq_chain_2d.rq_decorated_unbound = rq_decorated_unbound
	rq_chain_2d.breadth_1d = breadth_1d
	rq_chain_2d.pos_1d = pos_1d
	rq_chain_2d.dir_1d = dir_1d
	rq_chain_2d.pos_2d = pos_2d
	rq_chain_2d.dir_2d = dir_2d

	return rq_chain_2d
	
static func space_h(space) -> Fn:
	return box(Color(0,0,0,0), Vector2(space, 1))
	
static func space_v(space) -> Fn:
	return box(Color(0,0,0,0), Vector2(1, space))

static func box(color:Color, size:Vector2) -> Fn:
	var rq_gu = FnGuFromColor.new()
	rq_gu.color = color
	rq_gu.size = size
	return rq_gu

static func tex(tex:Texture) -> Fn:
	var rq_gu = FnGuFromTex.new()
	rq_gu.tex = tex
	return rq_gu
	
static func textd(txt:String) -> Fn:
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