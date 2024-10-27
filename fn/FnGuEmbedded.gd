extends Fn

class_name FnGuEmbedded

@export var size = Vector2(100,100)
@export var color = Color.DARK_RED
@export var rq_gu: Fn

func exec():
	var rq_box = FnGuFromColor.new()
	rq_box.color = color
	rq_box.size = size
	
	var rq_chain = FnGuChain.new()
	rq_chain.pos_next_rel = Pos.MIDDLE
	rq_chain.dir_next = Dir.NONE
	
	#rq_chain.arr_rq_gu = [rq_box, rq_gu]
	rq_chain.arr_rq_gu.append(rq_box)
	rq_chain.arr_rq_gu.append(rq_gu)
	
	return rq_chain.exec()
