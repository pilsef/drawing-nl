extends Fn

class_name FnGuCornered

@export var rq_gu : Fn
@export var width = 1
@export var length = 2
@export var color = Color.WHITE

func exec():
	
	var gu_base:Guber = rq_gu.exec()
	
	var rect_border = gu_base.bounds.grow(width)
	rect_border.position = Vector2.ZERO
	
	var size = rect_border.size
	var shrink_width = -1 * size + Vector2(width, width)
	var shrink_length = -1 * size + Vector2(length, length)
	
	var img = Image.create_empty(size.x, size.y, false, Image.FORMAT_RGBA8)
	
	var rect_left = rect_border.grow_side(SIDE_RIGHT, shrink_width.x)
	var rect_right = rect_border.grow_side(SIDE_LEFT, shrink_width.x)
	var rect_top = rect_border.grow_side(SIDE_BOTTOM, shrink_width.y)
	var rect_bottom = rect_border.grow_side(SIDE_TOP, shrink_width.y)
	
	img.fill_rect(rect_left.grow_side(SIDE_BOTTOM, shrink_length.y), color)
	img.fill_rect(rect_left.grow_side(SIDE_TOP, shrink_length.y), color)
	
	img.fill_rect(rect_right.grow_side(SIDE_BOTTOM, shrink_length.y), color)
	img.fill_rect(rect_right.grow_side(SIDE_TOP, shrink_length.y), color)
	
	img.fill_rect(rect_top.grow_side(SIDE_RIGHT, shrink_length.x), color)
	img.fill_rect(rect_top.grow_side(SIDE_LEFT, shrink_length.x), color)
	
	img.fill_rect(rect_bottom.grow_side(SIDE_RIGHT, shrink_length.x), color)
	img.fill_rect(rect_bottom.grow_side(SIDE_LEFT, shrink_length.x), color)
	
	var rq_gu_border = FnGuFromTex.new()
	rq_gu_border.tex = ImageTexture.create_from_image(img)
	
	var gu_border:Guber = rq_gu_border.exec()
	gu_border.place(gu_base, Vector2(width, width), Dir.DOWN_RIGHT)
	
	return gu_border
