extends Fn

class_name FnGuChain2d

@export var breadth_1d = 3
@export var arr_rq_gu: Array

@export var pos_1d_next_rel = Pos.TOP_RIGHT
@export var dir_1d_next = Dir.DOWN_RIGHT

@export var pos_2d_next_rel = Pos.BOTTOM_LEFT
@export var dir_2d_next = Dir.DOWN_RIGHT

func exec():

	var num_rows = ceil(arr_rq_gu.size() as float / breadth_1d)
	var rq_chain_2d = create_rq_chain(pos_2d_next_rel, dir_2d_next)

	for idx_row in num_rows:
		var rq_chain_1d = create_rq_chain_1d(
			arr_rq_gu, idx_row * breadth_1d, breadth_1d, pos_1d_next_rel, 
			dir_1d_next
		)
		rq_chain_2d.arr_rq_gu.append(rq_chain_1d)

	return rq_chain_2d.exec()

static func create_rq_chain_1d(
	arr_rq_gu, idx_start, breadth_1d, pos_1d_next_rel, dir_1d_next
):
	var rq_chain_1d = create_rq_chain(pos_1d_next_rel, dir_1d_next)
	
	for idx_col in min(breadth_1d, arr_rq_gu.size() - idx_start):
		var rq_gu = arr_rq_gu[idx_start + idx_col]
		rq_chain_1d.arr_rq_gu.append(rq_gu)
			
	return rq_chain_1d

static func create_rq_chain(pos_next_rel: Vector2, dir_next: Vector2):
	var rq_col = FnGuChain.new()
	rq_col.pos_next_rel = pos_next_rel
	rq_col.dir_next = dir_next
	return rq_col
