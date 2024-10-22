extends Node2D

func _ready():

	var rq_gu = load("res://windo_test.tres").rq_gu
	var gu = rq_gu.exec()
	add_child(gu)
	gu.position -= gu.bounds.position
	
	set_initial_window(gu.bounds.size)

func set_initial_window(size:Vector2):

	var window = get_window()
	window.min_size = Vector2(1,1)
	window.size = size

# see https://forum.godotengine.org/t/is-there-some-mismatch-between-godot-window-size-pixels-and-os-x-window-size/40140/3
	var retina_scale = DisplayServer.screen_get_scale()
	if (window.content_scale_factor != retina_scale):
		#we need to change, calculate the relative change in scale
		var relative_scale:float = retina_scale / window.content_scale_factor

		#apply the change, as well as resizing window based on previous scale and relative scale
		window.content_scale_factor = retina_scale
		window.size = window.size * relative_scale
		
	window.position = 0.5 * (DisplayServer.screen_get_size() - Vector2i(window.size))
