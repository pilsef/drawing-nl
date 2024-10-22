extends Fn

class_name FnGuFromAtlas

@export var rq_dict_atlas: Fn = load("res://rq/rq_atlas_dict_from_tex_pico.tres")
@export var iterable_wrapper: Array

func exec():
	var gu_chain = FnGuChain.new()
	
	var iterable = iterable_wrapper[0]
	var dict_atlas = rq_dict_atlas.exec()
	
	for key in iterable:
		var val = dict_atlas[key]
		var rq_tex = create_rq_tex(val)
		gu_chain.arr_rq_gu.append(rq_tex)
		
	return gu_chain.exec()

func create_rq_tex(tex):
	var rq_tex = FnGuFromTex.new()
	rq_tex.tex = tex
	return rq_tex
