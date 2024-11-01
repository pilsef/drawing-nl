extends Fn

class_name FnGuFromTextMultiline

@export var rq_fontdict: Fn = load("res://rq/rq_fontdict_from_tex_pico.tres")
@export var txt = "default text"
@export var line_len_max : int = 16
@export var line_spacing = 0.5

func exec():
	var rq_gu_chain = FnGuChain.new()
	rq_gu_chain.pos_next_rel = Pos.BOTTOM_LEFT
	rq_gu_chain.dir_next = Dir.DOWN_RIGHT + Vector2(0, line_spacing) * sqrt(2)
	
	var arr_lines = TextUtil.break_into_lines(txt, line_len_max)
	
	for str_line in arr_lines:
		var rq_gu_line = create_rq_gu_line(str_line)
		rq_gu_chain.arr_rq_gu.append(rq_gu_line)
		
	return rq_gu_chain.exec()

func create_rq_gu_line(string):
	var rq_gu_line = FnGuFromText.new()
	rq_gu_line.rq_fontdict = rq_fontdict
	rq_gu_line.txt = string
	return rq_gu_line
