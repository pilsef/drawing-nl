extends FnGu

class_name FnGuChainCentered

@export var dir = Dir.DOWN
@export var offset = Vector2()
@export var arr_rq_gu : Array[Fn]

func exec():
	var rq_gu_chain = FnGuChain.new()
	rq_gu_chain.dir_next = dir
	rq_gu_chain.pos_next_rel = get_pos()
	rq_gu_chain.offset = offset
	rq_gu_chain.arr_rq_gu = arr_rq_gu
	
	return rq_gu_chain.exec()
	
func get_pos():
	match dir:
		Dir.RIGHT: return Pos.RIGHT_MIDDLE
		Dir.LEFT: return Pos.LEFT_MIDDLE
		Dir.UP: return Pos.TOP_MIDDLE
		Dir.DOWN: return Pos.BOTTOM_MIDDLE
