extends Fn

class_name FnGuFromAtlas2D

@export var dim_1d = 3

@export var rq_dict_atlas: Fn
@export var iterable_wrapper: Array

@export var pos_1d_next_rel = Vector2(1,0)
@export var dir_1d_next = Vector2(1,1)

@export var pos_2d_next_rel = Vector2(0,1)
@export var dir_2d_next = Vector2(1,1)

func exec():
	var rq_gu_chain_2d = FnGuChain2d.new()
	
	rq_gu_chain_2d.dim_1d = dim_1d
	rq_gu_chain_2d.pos_1d_next_rel = pos_1d_next_rel
	rq_gu_chain_2d.dir_1d_next = dir_1d_next
	rq_gu_chain_2d.pos_2d_next_rel = pos_2d_next_rel
	rq_gu_chain_2d.dir_2d_next = dir_2d_next

	rq_gu_chain_2d.arr_tex = create_arr_tex(iterable_wrapper[0], rq_dict_atlas.exec())
		
	return rq_gu_chain_2d.exec()

func create_arr_tex(iterable, dict_atlas):
	var arr_tex = []
	
	for key in iterable:
		arr_tex.append(dict_atlas[key])
	return arr_tex
