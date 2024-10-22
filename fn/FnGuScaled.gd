extends Fn

class_name FnGuScaled

@export var scale: int = 2
@export var rq_gu: Fn

func exec():
	var gu = rq_gu.exec()
	gu.scale_by(Vector2(scale,scale))
	return gu
