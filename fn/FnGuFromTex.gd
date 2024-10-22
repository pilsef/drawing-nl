extends Fn

class_name FnGuFromTex

@export var tex: Texture2D

func exec():
	var spr = Sprite2D.new()
	spr.centered = false
	spr.texture = tex
	
	var gu = Guber.new()
	gu.add_child(spr)
	gu.bounds = spr.get_rect()
	
	return gu
