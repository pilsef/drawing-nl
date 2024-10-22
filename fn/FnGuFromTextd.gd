extends Fn

class_name FnGuFromTextd

@export var txt = "default text"

func exec():
	var rq_gu_atlas = FnGuFromAtlas.new()
	rq_gu_atlas.iterable_wrapper = [txt]
	rq_gu_atlas.rq_dict_atlas = load("res://rq/rq_atlas_dict_from_tex_pico.tres")
	return rq_gu_atlas.exec()
