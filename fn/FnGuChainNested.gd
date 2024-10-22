extends Fn

class_name FnGuChainNested

@export var pos_next_rel = Vector2(1,0)
@export var dir_next = Vector2(1,1)

@export var arr_baselem = []
@export var rq_base_template : Fn
@export var rq_nested_template : Fn

static var arr_baselem_names = ["tex", "txt"]

func exec():
	
	var rq_gu_chain = FnGuChain.new()
	rq_gu_chain.pos_next_rel = pos_next_rel
	rq_gu_chain.dir_next = dir_next
	
	for baselem in arr_baselem:
		var rq_base = rq_base_template.duplicate(true)
		assignBaselem(rq_base, baselem)
		
		var rq_nested = rq_nested_template.duplicate(true)
		rq_nested.rq_root = rq_base
		
		rq_gu_chain.arr_rq_gu.append(rq_nested)

	return rq_gu_chain.exec()

func assignBaselem(rq_base:Fn, baselem) :
	for baselem_name in arr_baselem_names:
		if baselem_name in rq_base:
			rq_base.set(baselem_name, baselem)
			break
