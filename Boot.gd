extends Node2D

@export var rq_gu_root:Fn

@export var arr_rq_other: Array[Fn]

func _ready():
	var gu_root = rq_gu_root.exec()
	add_child(gu_root)
	gu_root.position -= gu_root.bounds.position
	gu_root.position.x += 1

	set_initial_window(gu_root.bounds.size)
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey && event.keycode == KEY_K && event.is_released():
		var image = get_viewport().get_texture().get_image()
		var size = image.get_size() / get_window().content_scale_factor
		image.resize(size.x, size.y, Image.INTERPOLATE_NEAREST)
		
		var dt = Time.get_datetime_dict_from_system()
		var datetime = "%s-%s-%s@%s.%s.%s"  % [dt.year, dt.month, dt.day, dt.hour, dt.minute, dt.second]
		var path = "/Users/pilsef/Desktop/capture-%s.png" % datetime
		
		image.save_png(path)
		print("Screenshot saved as %s" % path)

func set_initial_window(size:Vector2):

	var window = get_window()
	window.min_size = Vector2(1,1)

	window.content_scale_factor = DisplayServer.screen_get_scale()
	window.size = size * window.content_scale_factor
		
	window.position = 0.5 * (DisplayServer.screen_get_size() - Vector2i(window.size))
