extends Fn

class_name FnGuChain2dDecorated

@export var arr_baselem = []
@export var fn_gu_from_baselem = null
@export var rq_decorated_unbound : Fn

@export var pos_1d = Pos.TOP_RIGHT
@export var dir_1d = Dir.DOWN_RIGHT

@export var pos_2d = Pos.BOTTOM_LEFT
@export var dir_2d = Dir.DOWN_RIGHT

@export var breadth_1d = 3

func exec():
	var rq_chain = FnGuChain2d.new()
	
	for baselem in arr_baselem:
		var rq_decorated = FnGuChainDecorated.build_rq(baselem, fn_gu_from_baselem, rq_decorated_unbound)
		rq_chain.arr_rq_gu.append(rq_decorated)

	rq_chain.pos_1d_next_rel = pos_1d
	rq_chain.dir_1d_next = dir_1d
	rq_chain.pos_2d_next_rel = pos_2d
	rq_chain.dir_2d_next = dir_2d

	rq_chain.breadth_1d = breadth_1d
	
	return rq_chain.exec()
