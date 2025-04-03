extends Node

class_name OrchBase

var iact:IactBase
var gu:Guber

func _ready():

	iact = load(get_script_base_dir() + "/Iact.gd").new()
	map_data_to_iact()
	add_child(iact)
	
	iact.connect("changed", re_add_gu)
	re_add_gu()
	
func map_data_to_iact():
	print("implement me!")
	
func map_iact_to_rq_gu(rq_gu):
	for prop in iact.get_property_list():
		if (prop.usage & PROPERTY_USAGE_SCRIPT_VARIABLE) && prop.name in rq_gu:
			rq_gu.set(prop.name, iact[prop.name])
	
func get_script_base_dir():
	return get_script().get_path().get_base_dir()
		
func re_add_gu():
	if gu != null:
		gu.queue_free()
		remove_child(gu)
	
	var rq_gu = load(get_script_base_dir() + "/FnGu.gd").new()
	map_iact_to_rq_gu(rq_gu)
	gu = rq_gu.exec()
	
	add_child(gu)
	center()
	#gu.position -= gu.bounds.position
	#set_window(gu.bounds.size.ceil())

func set_window(size:Vector2):

	var window = get_window()
	window.min_size = Vector2(1,1)

	window.content_scale_factor = DisplayServer.screen_get_scale()
	window.size = size * window.content_scale_factor
		
	window.position = 0.5 * (DisplayServer.screen_get_size() - Vector2i(window.size))
	
func center():
	
	# make window fill whole screen
	var window = get_window()
	window.content_scale_factor = DisplayServer.screen_get_scale()
	window.size = DisplayServer.screen_get_usable_rect().size
	window.position = Vector2(0,0)
	
	# center gu
	gu.position -= gu.bounds.position
	gu.position -= gu.bounds.size * 0.5
	gu.position += window.size * 0.5 / window.content_scale_factor
	
	# set clickable polygon
	var xx = gu.bounds.size.x
	var yy = gu.bounds.size.y
	window.mouse_passthrough_polygon = [
		(gu.position + gu.bounds.position + Vector2(0,0)) * window.content_scale_factor,
		(gu.position + gu.bounds.position + Vector2(xx, 0)) * window.content_scale_factor,
		(gu.position + gu.bounds.position + Vector2(xx, yy)) * window.content_scale_factor,
		(gu.position + gu.bounds.position + Vector2(0, yy)) * window.content_scale_factor
	]
	
	#var p = Polygon2D.new()
	#p.color = Color(1, 0.4, 0.7, 0.5)
	#p.polygon = [
		#(gu.position + gu.bounds.position + Vector2(0,0)),
		#(gu.position + gu.bounds.position + Vector2(xx, 0)),
		#(gu.position + gu.bounds.position + Vector2(xx, yy)),
		#(gu.position + gu.bounds.position + Vector2(0, yy))
	#]
	#add_child(p)
	#
	#gu.tree_exited.connect(func(): 
		#p.queue_free()
		#remove_child(p)
	#)
	
	
	
