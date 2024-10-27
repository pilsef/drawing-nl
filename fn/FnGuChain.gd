extends Fn

class_name FnGuChain

@export var pos_next_rel = Pos.TOP_RIGHT
@export var dir_next = Dir.DOWN_RIGHT

@export var arr_rq_gu : Array[Fn]

func exec():
	
	var gu_chain = Guber.new()
	var pos = Vector2(0,0) # doesn't matter what it is initially (same for dir)
	
	for rq_gu in arr_rq_gu:
		var rect_ch = gu_chain.place(rq_gu.exec(), pos, dir_next)
		pos = rect_ch.position + rect_ch.size * pos_next_rel

	return gu_chain