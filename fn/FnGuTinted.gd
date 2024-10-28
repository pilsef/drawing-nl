extends Fn

class_name FnGuTinted

@export var color = Color.BLACK
@export var rq_gu : Fn

func exec():
	var gu = rq_gu.exec()
	gu.modulate = color
	
	return gu
