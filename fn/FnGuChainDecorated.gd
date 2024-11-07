extends Fn

class_name FnGuChainDecorated

@export var pos = Pos.TOP_RIGHT
@export var dir = Dir.DOWN_RIGHT

@export var arr_baselem = []
@export var fn_gu_from_baselem : GDScript
@export var rq_decorated_unbound : Fn

func exec():
	
	var rq_gu_chain = FnGuChain.new()
	rq_gu_chain.pos_next_rel = pos # dir_to_pos_next_rel(dir)
	rq_gu_chain.dir_next = dir
	
	for baselem in arr_baselem:
		var rq_gu = build_rq(baselem, fn_gu_from_baselem, rq_decorated_unbound)
		rq_gu_chain.arr_rq_gu.append(rq_gu)
		
	return rq_gu_chain.exec()
	
#static func dir_to_pos_next_rel(dir:Vector2):
	#return (dir + Vector2(1,1)) * 0.5
	
static func build_rq(baselem, fn_gu_from_baselem, rq_decorated_unbound):
	var rq_base = fn_gu_from_baselem.new()
	assign_baselem(rq_base, baselem)
	
	var rq_decorated = rq_decorated_unbound.duplicate(true)
	rq_decorated.rq_gu = rq_base
	
	return rq_decorated

static func assign_baselem(rq_base:Fn, baselem) :
	for prop in rq_base.get_property_list():
		if prop.usage == 4102:
			rq_base.set(prop["name"], baselem)
