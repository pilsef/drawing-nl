extends Node2D

class_name Guber

var bounds:Rect2 # need to abs() before merging

func place(ch:Guber, posAbs = Vector2(0,0), dir = Vector2(1,1)):
	add_child(ch)
	ch.position = posAbs - ch.bounds.position
	ch.position += ch.bounds.size * (dir - Vector2(1,1)) * Vector2(0.5, 0.5)
	
	var rect_ch = Rect2(ch.bounds.position + ch.position, ch.bounds.size).abs()
	
	if bounds.size == Vector2.ZERO:
		bounds = rect_ch
	else:
		bounds = bounds.merge(rect_ch)
	
	return rect_ch

func place_multiple(arr_ch:Array, pos_next_rel = Vector2(1,0), dir_next = Vector2(1,1)):
	var pos = Vector2(0,0)
	var dir = Vector2(1,1)
	
	for ch in arr_ch:
		var rect_ch = place(ch, pos, dir)
		
#		var pos_next_rel = Vector2(1,0)
#		var dir_next = dir.rotated(deg2rad(90))
		
		pos = rect_ch.position + rect_ch.size * pos_next_rel
		dir = dir_next
