extends Fn

class_name FnGuFromText

@export var rq_fontdict: Fn = load("res://rq/rq_fontdict_from_tex_pico.tres")
@export var txt = "default text"

func exec():
	var gu_chain = FnGuChain.new()
	var fontdict = rq_fontdict.exec()
	
	for chr in txt:
		var tex = fontdict[chr]
		var rq_tex = create_rq_tex(tex)
		gu_chain.arr_rq_gu.append(rq_tex)
		
	return gu_chain.exec()

func create_rq_tex(tex):
	var rq_tex = FnGuFromTex.new()
	rq_tex.tex = tex
	return rq_tex
