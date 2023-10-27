extends Resource

class_name FnGuFromLightswitch

export (bool) var is_on

func exec():
	var spr = Sprite.new()
	spr.centered = false
	spr.texture = load("res://lightbulb.png")
	spr.modulate = Color.white if is_on else Color.black
	
	var gu = Guber.new()
	gu.add_child(spr)
	gu.bounds = spr.get_rect()
	
	return gu
