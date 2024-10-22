extends Fn

class_name FnGuChain2D

@export var dim_1d = 3
@export var arr_tex: Array

@export var pos_1d_next_rel = Vector2(1,0)
@export var dir_1d_next = Vector2(1,1)

@export var pos_2d_next_rel = Vector2(0,1)
@export var dir_2d_next = Vector2(1,1)

func exec():

	var ctr = 0
	var num_rows = ceil(arr_tex.size() as float / dim_1d)
	var rq_chain_2d = create_rq_chain(pos_2d_next_rel, dir_2d_next)

	for row in num_rows:
		var rq_chain_1d = create_rq_chain_1d(arr_tex, ctr * dim_1d, dim_1d)
		rq_chain_2d.arr_rq_gu.append(rq_chain_1d)
		ctr += 1

	return rq_chain_2d.exec()

func create_rq_chain_1d(arr_tex, idx_start, dim_1d):
	var rq_chain_1d = create_rq_chain(pos_1d_next_rel, dir_1d_next)
	
	for idx_col in min(dim_1d, arr_tex.size() - idx_start):
		var tex = arr_tex[idx_start + idx_col]
		var rq_tex = create_rq_tex(tex)
		rq_chain_1d.arr_rq_gu.append(rq_tex)
			
	return rq_chain_1d

func create_rq_chain(pos_next_rel = Vector2(1,0), dir_next = Vector2(1,1)):
	var rq_col = FnGuChain.new()
	rq_col.pos_next_rel = pos_next_rel
	rq_col.dir_next = dir_next
	return rq_col

func create_rq_tex(tex):
	var rq_tex = FnGuFromTex.new()
	rq_tex.tex = tex
	return rq_tex
