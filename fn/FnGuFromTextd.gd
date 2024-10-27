extends Fn

class_name FnGuFromTextd

@export var txt = "default text"

func exec():
	var rq_gu_from_text = FnGuFromText.new()
	rq_gu_from_text.txt = txt
	rq_gu_from_text.rq_fontdict = load("res://rq/rq_fontdict_from_tex_pico.tres")
	return rq_gu_from_text.exec()
