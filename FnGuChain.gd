extends Resource

class_name FnGuChain

export var pos_next_rel = Vector2(1,0)
export var dir_next = Vector2(1,1)

export (Array, Resource) var arr_fn_gu # rename!!!!!!

func exec():
	
	var gu = Guber.new()
	
	var pos = Vector2(0,0) # doesn't matter what it is initially
	var dir = Vector2(1,1) # doesn't matter what it is initially
	
	for fn in arr_fn_gu:
		var ch = fn.exec()
		var rect_ch = gu.place(ch, pos, dir)
		
#		var pos_next_rel = Vector2(1,0)
#		var dir_next = dir.rotated(deg2rad(90))
		
		pos = rect_ch.position + rect_ch.size * pos_next_rel
		dir = dir_next

	return gu
