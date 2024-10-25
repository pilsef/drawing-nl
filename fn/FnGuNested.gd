extends Fn

class_name FnGuNested

@export var arr_rq_hierarchy : Array[Fn]
@export var rq_gu : Fn

func exec():

	var rq_last = rq_gu
		
	for rq_curr in arr_rq_hierarchy:
		rq_curr.rq_gu = rq_last
		rq_last = rq_curr
		
	return rq_last.exec()
