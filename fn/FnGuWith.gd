extends Fn

class_name FnGuWith

@export var rq_gu_item: Fn
@export var rq_gu: Fn

@export var pos = Pos.MIDDLE
@export var dir = Dir.NONE
@export var offset = Vector2()

func exec():
	
	var gu_dest:Guber = rq_gu.exec()
	
	var rect_dest = gu_dest.bounds
	var pos_dest = rect_dest.position + rect_dest.size * pos + offset
	
	gu_dest.place(rq_gu_item.exec(), pos_dest, dir)
	#gu_dest.bounds = rect_dest # revert?

	return gu_dest
