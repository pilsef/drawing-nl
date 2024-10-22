extends Fn

class_name FnGuPadded

@export var rq_gu: Fn

@export var left_top: Vector2 = Vector2(0,0)
@export var right_bottom: Vector2 = Vector2(0,0)

func exec():
	
	var gu = rq_gu.exec()
	gu.pad(left_top, right_bottom)
	
	return gu
