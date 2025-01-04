extends Fn

class_name FnGuChain

@export var pos_next_rel = Pos.TOP_RIGHT
@export var dir_next = Dir.DOWN_RIGHT
@export var offset = Vector2()

@export var arr_rq_gu : Array[Fn]

func exec():
	
	var gu_chain = Guber.new()
	var rect_prev = Rect2()
	
	for rq_gu in arr_rq_gu:
		var pos_abs = rect_prev.position + rect_prev.size * pos_next_rel + offset
		rect_prev = gu_chain.place(rq_gu.exec(), pos_abs, dir_next)

	return gu_chain
