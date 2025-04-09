extends Fn

class_name FnGu

static func cornered(color:Color, width:int, length:int, rq_gu:Fn = null):
	var rq_cornered = FnGuCornered.new()
	rq_cornered.color = color
	rq_cornered.width = width
	rq_cornered.length = length
	rq_cornered.rq_gu = rq_gu
	return rq_cornered
	
static func bordered(color:Color, width:int, rq_gu:Fn = null):
	var rq_bordered = FnGuBordered.new()
	rq_bordered.color = color
	rq_bordered.width = width
	rq_bordered.rq_gu = rq_gu
	return rq_bordered

static func with(
	rq_gu_item:Fn, pos:Vector2, dir:Vector2, offset:Vector2, rq_gu:Fn = null
):
	var rq_with = FnGuWith.new()
	rq_with.rq_gu_item = rq_gu_item
	rq_with.pos = pos
	rq_with.dir = dir
	rq_with.offset = offset
	rq_with.rq_gu = rq_gu
	return rq_with

static func embedded_c(size:Vector2, rq_gu:Fn = null):
	return embedded(size, Pos.MIDDLE, Dir.NONE, Vector2(), rq_gu)

static func embedded(
	size:Vector2, pos:Vector2, dir:Vector2, offset:Vector2, 
	rq_gu:Fn = null
):
	var rq_embedded = FnGuEmbedded.new()
	rq_embedded.size = size
	rq_embedded.pos = pos
	rq_embedded.dir = dir
	rq_embedded.offset = offset
	rq_embedded.rq_gu = rq_gu
	return rq_embedded
	
static func padgrounded_hv(color:Color, pad_h, pad_v, rq_gu:Fn = null):
	return padgrounded(color, pad_h, pad_h, pad_v, pad_v, rq_gu)
	
static func padgrounded_a(color:Color, pad, rq_gu:Fn = null):
	return padgrounded(color, pad, pad, pad, pad, rq_gu)
	
static func padgrounded(
	color:Color, pad_l, pad_r, pad_t, pad_b, rq_gu:Fn = null
):
	return decorated(
		[
			padded(pad_l, pad_r, pad_t, pad_b),
			backgrounded(color)
		], rq_gu
	)

static func map(arr_tex, func_baselem_to_rq_gu, arr_rq_hierarchy):
	return arr_tex.map(
		func(tex):
			return decorated(arr_rq_hierarchy, func_baselem_to_rq_gu.call(tex))
	)

static func map_img(arr_tex, arr_rq_hierarchy):
	return map(arr_tex, img, arr_rq_hierarchy)

static func map_textd(arr_str, arr_rq_hierarchy):
	return map(arr_str, textd, arr_rq_hierarchy)

# top to bottom
static func decorated(arr_rq_hierarchy:Array, rq_gu:Fn = null):
	var rq_decorated = FnGuDecorated.new()
	rq_decorated.arr_rq_hierarchy = arr_rq_hierarchy
	rq_decorated.rq_gu = rq_gu
	return rq_decorated

static func gridded_2(
	grid:Node, fn:Callable, dir_1d = Dir.RIGHT, dir_2d = Dir.DOWN
):
	var breadth_1d = grid.get_child(0).get_child_count()
	var arr_rq_children = []
	for row in grid.get_children():
		for item in row.get_children():
			arr_rq_children.append(fn.call(item))
	return gridded(arr_rq_children, breadth_1d, dir_1d, dir_2d)

static func gridded(
	arr_rq_gu:Array, breadth_1d = 3, dir_1d = Dir.RIGHT, dir_2d = Dir.DOWN
):
	var rq_grid = FnGuGrid.new()
	rq_grid.arr_rq_gu = arr_rq_gu
	rq_grid.breadth_1d = breadth_1d
	rq_grid.dir_1d = dir_1d
	rq_grid.dir_2d = dir_2d
	return rq_grid

static func chained_c(arr_rq_gu:Array[Fn], dir = Dir.DOWN, offset = Vector2()):
	var rq_chained_c = FnGuChainCentered.new()
	rq_chained_c.arr_rq_gu = arr_rq_gu
	rq_chained_c.dir = dir
	rq_chained_c.offset = offset
	return rq_chained_c

static func chained(
	arr_rq_gu:Array, pos = Pos.BOTTOM_LEFT, dir = Dir.DOWN_RIGHT, offset = Vector2()
) -> Fn:
	var rq_chain = FnGuChain.new()
	rq_chain.arr_rq_gu = arr_rq_gu
	rq_chain.pos_next_rel = pos
	rq_chain.dir_next = dir
	rq_chain.offset = offset

	return rq_chain

static func chained_2d(
	arr_rq_gu:Array, breadth_1d = 3, 
	pos_1d = Pos.TOP_RIGHT, dir_1d = Dir.DOWN_RIGHT, 
	pos_2d = Pos.BOTTOM_LEFT, dir_2d = Dir.DOWN_RIGHT
) -> Fn:

	var rq_chain_2d = FnGuChain2d.new()
	rq_chain_2d.arr_rq_gu = arr_rq_gu
	rq_chain_2d.breadth_1d = breadth_1d
	rq_chain_2d.pos_1d_next_rel = pos_1d
	rq_chain_2d.dir_1d_next = dir_1d
	rq_chain_2d.pos_2d_next_rel = pos_2d
	rq_chain_2d.dir_2d_next = dir_2d

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

static func img(tex:Texture) -> Fn:
	var rq_gu = FnGuFromTex.new()
	rq_gu.tex = tex
	return rq_gu

static func textd_multiline(txt:String, line_len_max) -> Fn:
	var rq_gu = FnGuFromTextMultiline.new()
	rq_gu.txt = txt
	rq_gu.line_len_max = line_len_max
	return rq_gu

static func textd(txt:String) -> Fn:
	var rq_gu = FnGuFromTextd.new()
	rq_gu.txt = txt
	return rq_gu

static func rotated(amt:float, rq_gu:Fn = null):
	var rq_rotated = FnGuRotated.new()
	rq_rotated.amt = amt
	rq_rotated.rq_gu = rq_gu
	return rq_rotated

static func tinted(color:Color, rq_gu:Fn = null) -> Fn:
	var rq_gu_tinted = FnGuTinted.new()
	rq_gu_tinted.color = color
	rq_gu_tinted.rq_gu = rq_gu
	return rq_gu_tinted

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
	return padded(amt, amt, amt, amt, rq_gu)

static func padded_hv(pad_h, pad_v, rq_gu:Fn = null):
	return padded(pad_h, pad_h, pad_v, pad_v, rq_gu)

static func padded_h(left, right, rq_gu:Fn = null):
	return padded(left, right, 0, 0, rq_gu)

static func padded_v(top, bottom, rq_gu:Fn = null):
	return padded(0, 0, top, bottom, rq_gu)

static func sized_c(size, rq_gu:Fn = null) -> Fn:
	return sized(size, Pos.MIDDLE, Dir.NONE, Vector2(), rq_gu)
	
static func sized(size, pos, dir, offset, rq_gu) -> Fn:
	var rq_gu_sized = FnGuSized.new()
	rq_gu_sized.size = size
	rq_gu_sized.rq_gu = rq_gu
	rq_gu_sized.pos = pos
	rq_gu_sized.dir = dir
	rq_gu_sized.offset = offset
	return rq_gu_sized

static func scaled(scale, rq_gu:Fn = null) -> Fn:
	var rq_gu_scaled = FnGuScaled.new()
	rq_gu_scaled.scale = scale
	rq_gu_scaled.rq_gu = rq_gu
	return rq_gu_scaled
