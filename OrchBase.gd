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
	print("implement me!")
	
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
	gu.position -= gu.bounds.position
	set_window(gu.bounds.size.ceil())

func set_window(size:Vector2):

	var window = get_window()
	window.min_size = Vector2(1,1)

	window.content_scale_factor = DisplayServer.screen_get_scale()
	window.size = size * window.content_scale_factor
		
	window.position = 0.5 * (DisplayServer.screen_get_size() - Vector2i(window.size))
