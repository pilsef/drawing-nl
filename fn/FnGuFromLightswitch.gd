extends Fn

class_name FnGuFromLightswitch

@export var is_on: bool

func exec():
	
	var rq_gu = FnGuFromTex.new()
	rq_gu.tex = load("res://tex/lightbulb.png")
	
	var gu = rq_gu.exec()
	gu.modulate = Color.WHITE if is_on else Color.BLACK
	
	return gu
