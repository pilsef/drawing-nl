extends Fn

class_name FnGuBordered

@export var rq_gu : Fn
@export var width = 1
@export var color = Color.WHITE

func exec():
	
	var gu_base:Guber = rq_gu.exec()
	
	var rect_border = gu_base.bounds.grow(width)
	rect_border.position = Vector2.ZERO
	
	var size = rect_border.size
	var shrink_h = -size.x + width
	var shrink_v = -size.y + width
	
	var img = Image.create_empty(size.x, size.y, false, Image.FORMAT_RGBA8)
	img.fill_rect(rect_border.grow_side(SIDE_RIGHT, shrink_h), color)
	img.fill_rect(rect_border.grow_side(SIDE_LEFT, shrink_h), color)
	img.fill_rect(rect_border.grow_side(SIDE_TOP, shrink_v), color)
	img.fill_rect(rect_border.grow_side(SIDE_BOTTOM, shrink_v), color)
	
	var rq_gu_border = FnGuFromTex.new()
	rq_gu_border.tex = ImageTexture.create_from_image(img)
	
	var gu_border:Guber = rq_gu_border.exec()
	gu_border.place(gu_base, Vector2(width, width), Dir.DOWN_RIGHT)
	
	return gu_border
