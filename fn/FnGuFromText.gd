extends Fn

class_name FnGuFromText

@export var rq_fontdict: Fn = load("res://rq/rq_fontdict_from_tex_pico.tres")
@export var txt = "default text"

func exec():
	var gu_chain = FnGuChain.new()
	var fontdict:Dictionary = rq_fontdict.exec()
	
	for chr in txt:
		var rq_tex = create_rq_tex(fontdict, chr)
		gu_chain.arr_rq_gu.append(rq_tex)
		
	return gu_chain.exec()

func create_rq_tex(fontdict:Dictionary, chr):
	if fontdict.has(chr):
		var rq_tex = FnGuFromTex.new()
		rq_tex.tex = fontdict[chr]
		return rq_tex
	else:
		var rq_tex = FnGuFromColor.new()
		rq_tex.color = Color.WHITE
		rq_tex.size = Vector2(8,8)
		return rq_tex
