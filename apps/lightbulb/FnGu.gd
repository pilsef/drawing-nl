extends FnGu

var is_on : bool

func exec():
	
	var rq_gu_lightbulb = img(load("res://tex/lightbulb.png"))
	
	if is_on:
		return scaled(1.2, tinted(Color.WHITE, rq_gu_lightbulb)).exec()
	else:
		return tinted(Color.BLACK, rq_gu_lightbulb).exec()
