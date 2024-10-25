extends Fn

class_name FnGuPadded

@export var rq_gu: Fn

@export var left = 0
@export var right = 0
@export var top = 0
@export var bottom = 0

func exec():
	
	var gu = rq_gu.exec()
	gu.pad(left, right, top, bottom)
	
	return gu
