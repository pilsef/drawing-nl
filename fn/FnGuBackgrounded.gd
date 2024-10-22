extends Fn

class_name FnGuBackgrounded

@export var color: Color
@export var rq_gu: Fn

func exec():
	var gu_foreground = rq_gu.exec()
	
	var rq_bg = FnGuFromColor.new()
	rq_bg.color = color
	rq_bg.size = gu_foreground.bounds.size
	var gu_background = rq_bg.exec()
	
	var gu_result = Guber.new()
	gu_result.place(gu_background)
	gu_result.place(gu_foreground)

	return gu_result
