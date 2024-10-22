extends Node2D

class_name Guber

var bounds:Rect2 # need to abs() before merging

func place(ch:Guber, pos_abs = Vector2(0,0), dir = Vector2(1,1)):
	
	add_child(ch)
	ch.position = pos_abs - ch.bounds.position
	ch.position += ch.bounds.size * (dir - Vector2(1,1)) * Vector2(0.5, 0.5)

	var rect_ch = Rect2(ch.bounds.position + ch.position, ch.bounds.size).abs()

	if bounds.size == Vector2.ZERO:
		bounds = rect_ch
	else:
		bounds = bounds.merge(rect_ch)
		
	return rect_ch
	
func pad(left_top = Vector2(0,0), right_bottom = Vector2(0,0)):
	bounds = bounds.grow_individual(left_top.x, left_top.y, right_bottom.x, right_bottom.y)
	bounds = bounds.abs()

func scale_by(ratio:Vector2):
	apply_scale(ratio)
	
	bounds.position *= ratio
	bounds.size *= ratio

#func placeStr(txt):
#	var font = DynamicFont.new()
#	font.font_data = load("res://FontHack.ttf")
##	font.size = 32
#
#	var label = Label.new()
#	label.set("custom_fonts/font", font)
#	label.text = txt
#	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
#
#	var gu = Guber.new()
#	gu.add_child(label)
#	gu.bounds = Rect2(Vector2(0,0), font.get_string_size(txt))
#
#	return gu

#func place_multiple(arr_rq:Array, pos_next_rel = Vector2(1,0), dir_next = Vector2(1,1)):
#	var pos = Vector2(0,0)
#	var dir = Vector2(1,1)
#
#	for rq in arr_rq:
#		var rect_ch = place(rq, pos, dir)
#
##		var pos_next_rel = Vector2(1,0)
##		var dir_next = dir.rotated(deg2rad(90))
#
#		pos = rect_ch.position + rect_ch.size * pos_next_rel
#		dir = dir_next
