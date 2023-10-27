extends Resource

class_name FnGuFromImg

export (Texture) var tex

func exec():
	var spr = Sprite.new()
	spr.centered = false
	spr.texture = tex
	
	var gu = Guber.new()
	gu.add_child(spr)
	gu.bounds = spr.get_rect()
	
	return gu
