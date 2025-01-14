extends Node2D

class_name Guber

@export var bounds:Rect2 # need to abs() before merging

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
	
func place_rel(ch:Guber, pos = Pos.MIDDLE, dir = Dir.NONE, offset = Vector2()):
	var pos_dest = bounds.position + bounds.size * pos + offset
	place(ch, pos_dest, dir)

func pad(left = 0, right = 0, top = 0, bottom = 0):
	bounds = bounds.grow_individual(left, top, right, bottom)
	bounds = bounds.abs()

func scale_by(ratio:Vector2):
	apply_scale(ratio)
	
	bounds.position *= ratio
	bounds.size *= ratio

func to_rq():
	var ps_gu = PackedScene.new()
	for ch in get_children():
		ch.propagate_call("set_owner", [self])
	ps_gu.pack(self)
	
	var rq_gu = FnGuFromPs.new()
	rq_gu.ps_gu = ps_gu
	
	return rq_gu

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
