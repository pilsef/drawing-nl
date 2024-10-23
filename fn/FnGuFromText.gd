extends Fn

class_name FnGuFromText

@export var txt = "default text"
@export var rq_font_atlas : FnAtlasDictFromTex

func exec():
	var rq_gu_atlas = FnGuFromAtlas.new()
	rq_gu_atlas.iterable_wrapper = [txt]
	rq_gu_atlas.rq_dict_atlas = rq_font_atlas
	return rq_gu_atlas.exec()
