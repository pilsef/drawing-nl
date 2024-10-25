extends Fn

class_name FnGuChainNested

@export var dir = Vector2.RIGHT

@export var arr_baselem = []
@export var class_baselem : GDScript
@export var rq_nested_template : Fn

func exec():
	
	var rq_gu_chain = FnGuChain.new()
	rq_gu_chain.pos_next_rel = dir_to_pos_next_rel(dir)
	rq_gu_chain.dir_next = dir
	
	for baselem in arr_baselem:
		var rq_gu = build_rq(baselem, class_baselem, rq_nested_template)
		rq_gu_chain.arr_rq_gu.append(rq_gu)
		
	return rq_gu_chain.exec()
	
static func dir_to_pos_next_rel(dir:Vector2):
	return (dir + Vector2(1,1)) * 0.5
	
static func build_rq(baselem, class_baselem, rq_nested_template):
	var rq_base = class_baselem.new()
	assign_baselem(rq_base, baselem)
	
	var rq_nested = rq_nested_template.duplicate(true)
	rq_nested.rq_gu = rq_base
	
	return rq_nested

static func assign_baselem(rq_base:Fn, baselem) :
	for prop in rq_base.get_property_list():
		if prop.usage == 4102:
			rq_base.set(prop["name"], baselem)
