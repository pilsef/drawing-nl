extends Fn

class_name FnGuTree

@export var rq_gu_root : Fn
@export var arr_render_step : Array[RenderStep]

func exec():

	var gu_root = rq_gu_root.exec()
	var rect_root = gu_root.bounds

	for ren_step in arr_render_step:
		var pos_child = rect_root.position + rect_root.size * ren_step.pos_render
		var gu_child = ren_step.rq_gu.exec()
		gu_root.place(gu_child, pos_child, ren_step.dir_render)

	return gu_root
