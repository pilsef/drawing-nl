extends Fn

class_name FnGuFromColor

@export var color: Color = Color(0,0,0,0)
@export var size: Vector2i = Vector2(16,16)

func exec():

	var img = Image.create_empty(size.x, size.y, false, Image.FORMAT_RGBA8)
	img.fill(color)
	
	var rq_gu = FnGuFromTex.new()
	rq_gu.tex = ImageTexture.create_from_image(img)
	
	return rq_gu.exec()
