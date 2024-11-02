extends Fn

class_name FnGuScaled

@export var scale = 2.0
@export var rq_gu: Fn

func exec():
	var gu = rq_gu.exec()
	gu.scale_by(Vector2(scale,scale))
	
	var gu_new = Guber.new()
	gu_new.place(gu)
	
	return gu_new
