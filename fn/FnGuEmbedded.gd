extends Fn

class_name FnGuEmbedded

@export var size = Vector2(100,100)
@export var color = Color.DARK_RED
@export var rq_gu: Fn

@export var pos = Pos.MIDDLE
@export var dir = Dir.NONE
@export var offset = Vector2()

func exec():
	var rq_dest = FnGuFromColor.new()
	rq_dest.color = color
	rq_dest.size = size
	
	var gu_dest:Guber = rq_dest.exec()
	
	var rect_dest = gu_dest.bounds
	var pos_dest = rect_dest.position + rect_dest.size * pos + offset
	
	gu_dest.place(rq_gu.exec(), pos_dest, dir)
	#gu_dest.bounds = rect_dest # revert?

	return gu_dest
